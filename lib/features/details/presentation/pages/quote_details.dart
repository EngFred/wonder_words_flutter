import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/bloc/theme_block.dart';
import '../bloc/quote_detail_bloc.dart';

class QuoteDetails extends StatefulWidget {
  final int quoteId;
  const QuoteDetails({super.key, required this.quoteId});

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuoteDetailBloc>(context)
        .add(FetchedQuoteDetails(quoteId: widget.quoteId));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = context.watch<ThemeBloc>().currentThemeMode;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: BlocBuilder<QuoteDetailBloc, QuoteDetailState>(
          builder: (context, state) {
            if (state is QuoteDetailsError) {
              return Center(
                child: Text(
                  state.errorMsg,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is QuoteDetailsSuccess) {
              if (state.quoteDetailsModel != null) {
                final quote = state.quoteDetailsModel!;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                        InkWell(
                          onTap: () {
                            if (!quote.userDetails.favorite) {
                              context
                                  .read<QuoteDetailBloc>()
                                  .add(FavQuote(quoteId: widget.quoteId));
                            } else {
                              context
                                  .read<QuoteDetailBloc>()
                                  .add(UnfavQuote(quoteId: widget.quoteId));
                            }
                          },
                          child: Column(
                            children: [
                              Icon(quote.userDetails.favorite
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              Text(
                                quote.favoritesCount.toString(),
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (!quote.userDetails.upvote) {
                              context
                                  .read<QuoteDetailBloc>()
                                  .add(UpvoteQuote(quoteId: widget.quoteId));
                            }
                          },
                          child: Column(
                            children: [
                              const Icon(Icons.arrow_upward),
                              Text(
                                quote.upvotesCount.toString(),
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (!quote.userDetails.downvote) {
                              context
                                  .read<QuoteDetailBloc>()
                                  .add(DownvoteQuote(quoteId: widget.quoteId));
                            }
                          },
                          child: Column(
                            children: [
                              const Icon(Icons.arrow_downward),
                              Text(
                                quote.downvotesCount.toString(),
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final quoteText =
                                '"${quote.body}" - ${quote.author}';
                            final result = await Share.share(quoteText);
                            if (result.status == ShareResultStatus.success) {}
                          },
                          icon: const Icon(Icons.share),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.format_quote_outlined,
                                size: 45,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${quote.body}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'font1',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.format_quote_outlined,
                                    size: 45,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "${quote.author}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    "Quote not found!",
                    textAlign: TextAlign.center,
                  ),
                );
              }
            }
            return Center(
              child: SpinKitDoubleBounce(
                color: currentTheme == ThemeData.light()
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
