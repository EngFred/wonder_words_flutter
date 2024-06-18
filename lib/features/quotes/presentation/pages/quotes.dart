import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:wonder_words/features/quotes/domain/entities/quote_of_the_day_model.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';
import 'package:wonder_words/features/quotes/domain/usecases/get_quote_of_the_day_usecase.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_bloc.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_event.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_state.dart';
import 'package:wonder_words/features/quotes/utils/utils.dart';

import '../../../../core/navigation/routes_generator.dart';
import '../../../../core/theme/bloc/theme_block.dart';
import '../../../../injection_container.dart';
import '../../../auth/utils/shared_preferences_helper.dart';
import '../../domain/entities/quotes_category.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  final prefs = sl<SharedPreferencesHelper>();
  QuoteCategory selectedCategory = QuoteCategory.all;

  void _onCategorySelected(QuoteCategory category) {
    setState(() {
      selectedCategory = category;
    });
    BlocProvider.of<QuotesBloc>(context)
        .add(FetchQuotes(category: selectedCategory));
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuotesBloc>(context)
        .add(FetchQuotes(category: QuoteCategory.all));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Logger().d("Did change dependencies has been called!");
    //_getQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = context.watch<ThemeBloc>().currentThemeMode;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            _buildSearchTexField(),
            const SizedBox(
              height: 10,
            ),
            _buildCategoriesList(currentTheme),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<QuotesBloc, QuotesState>(
                  builder: (contex, state) {
                if (state is QuotesError) {
                  return Center(
                    child: Text(
                      state.errMsg,
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (state is QuotesSuccess) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      // childAspectRatio:
                      //     0.5, // Adjust the aspect ratio as needed
                    ),
                    itemCount: state.quotesResponseModel.quotes.length,
                    itemBuilder: (context, index) {
                      final quote = state.quotesResponseModel.quotes[index];
                      return _buildGridItem(quote);
                    },
                  );
                }
                return Center(
                  child: SpinKitDoubleBounce(
                    color: currentTheme == ThemeData.light()
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                );
              }),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildGridItem(QuoteModel quote) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesGenerator.quoteDetailsPage,
          arguments: quote.id,
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          child: Column(
            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.format_quote_outlined),
                    Icon(Icons.favorite)
                  ]),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    quote.body ?? "",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'font1', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.format_quote_outlined),
                    Text(
                      quote.author ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTexField() {
    return TextField(
        onChanged: (value) {},
        decoration: const InputDecoration(
            hintText: "Search", suffixIcon: Icon(Icons.search)));
  }

  Widget _buildCategoriesList(ThemeData currentTheme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: QuoteCategory.values.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: OutlinedButton(
              onPressed: () {
                if (selectedCategory != category) {
                  _onCategorySelected(category);
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: selectedCategory == category
                      ? Theme.of(context).primaryColor
                      : currentTheme == ThemeData.light()
                          ? Colors.black
                          : Colors.grey, // change to your desired color
                ),
                backgroundColor: selectedCategory == category
                    ? currentTheme == ThemeData.light()
                        ? Theme.of(context).primaryColor
                        : Colors.white
                    : null,
                foregroundColor: selectedCategory == category
                    ? currentTheme == ThemeData.light()
                        ? Colors.white
                        : Colors.black54
                    : currentTheme == ThemeData.light()
                        ? Colors.black
                        : Colors.grey, // ,
              ),
              child: Text(
                category.displayName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _getQuoteOfTheDay() async {
    final qotdUsecase = sl<GetQuoteOfTheDayUsecase>();
    final qotd = await qotdUsecase(params: null);
    if (qotd != null) {
      _showQuoteOfTheDayDialog(qotd);
    }
  }

  void _showQuoteOfTheDayDialog(QuoteOfTheDayModel qotd) {
    if (qotd.quote.body != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const SizedBox(
              width: double.infinity,
              child: Text(
                "Quote of the day!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              height: 300,
              child: Column(
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.format_quote_outlined),
                        Icon(Icons.favorite)
                      ]),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${qotd.quote.body} (${extractYear(qotd.qotdDate)})",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'font1',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.format_quote_outlined),
                        Text(
                          qotd.quote.author ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
