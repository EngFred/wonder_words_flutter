# Wonder Words

Wonder Words is a Flutter application that uses the Quotes API to bring inspiring and motivational quotes to your fingertips. This app allows users to authenticate, fetch quotes by category, search quotes, manage user profiles, and much more. The app is built using clean architecture principles to ensure a scalable and testable codebase.

## Features

**User Authentication**: Secure user authentication to manage access.
- **Fetch Quotes**: Retrieve a wide range of quotes.
- **Fetch Quotes by Category**: Filter quotes based on categories.
- **Search Quotes**: Search for quotes by keywords.
- **User Profile**: Manage user profiles.
- **Change App Theme**: Switch between light and dark themes.
- **Quote of the Day**: Get the daily inspirational quote.
- **Pagination**: Efficiently load quotes with pagination.
- **Quote Reactions**: Upvote, downvote, add to favorites, and remove from favorites.
- **Share Quotes**: Share your favorite quotes with other apps.
- **Fetch Quote Details**: Get detailed information about a specific quote.

## Project Structure

The project is organized by feature, making it easy to scale and maintain.

## Packages Used

### Key Packages and Their Importance:

- **flutter_bloc: ^8.1.6**
  - Enables the implementation of the BLoC (Business Logic Component) pattern, providing a scalable and maintainable way to manage state and logic in Flutter applications.

- **shared_preferences: ^2.2.3**
  - Allows persistent storage of simple data types locally, used here for storing user preferences and settings.

- **retrofit: ^4.1.0**
  - Simplifies the creation of RESTful APIs and efficient data fetching from the Quotes API.

- **json_annotation: ^4.9.0**
  - Used for JSON serialization and deserialization, essential for converting JSON data from API responses into Dart objects.

- **get_it: ^7.7.0**
  - A lightweight dependency injection container used for managing dependencies across the app, promoting modularity and testability.

- **equatable: ^2.0.5**
  - Simplifies equality comparisons of Dart objects, enhancing performance and readability in data models and state management.

- **cached_network_image: ^3.3.1**
  - Caches network images locally, improving app performance by reducing redundant image downloads and enhancing user experience.

- **flutter_native_splash: ^2.4.0**
  - Generates native splash screens for various platforms, ensuring a professional and seamless app launch experience.

- **freezed_annotation: ^2.4.1**
  - Provides code generation for immutable classes and unions, enhancing type safety and reducing boilerplate code.

- **infinite_scroll_pagination: ^4.0.0**
  - Implements infinite scroll pagination for efficiently fetching and displaying large datasets, enhancing user experience and performance.

- **logger: ^2.3.0**
  - Provides a simple logging framework for debugging and monitoring app behavior during development.

- **hydrated_bloc: ^9.1.5**
  - Persists BLoC state between app restarts, ensuring seamless user experience and preventing data loss.

- **path_provider: ^2.1.3**
  - Locates directories on the filesystem, crucial for accessing local storage and managing files within the app.

- **dio: ^5.4.3+1**
  - A powerful HTTP client for Dart, simplifying network requests and handling API interactions with ease.

- **validators: ^3.0.0**
  - Offers a collection of common validation functions, ensuring data integrity and user input validation in forms and input fields.

- **flutter_spinkit: ^5.2.1**
  - Offers a collection of loading indicators (spinners) to provide visual feedback during data fetching and processing.

- **intl: ^0.19.0**
  - Provides internationalization and localization support, enabling the app to support multiple languages and locales seamlessly.

- **share_plus: ^9.0.0**
  - Enhances sharing functionalities by providing a unified API for sharing content with other apps on the device.


To run this project locally, follow these steps:

1. **Clone the repository:**
    ```sh
    git clone https://github.com/engFred/wonder-words-flutter.git
    cd wonder-words
    ```

2. **Install dependencies:**
    ```sh
    flutter pub get
    ```

3. **Run the app:**
    ```sh
    flutter run
    ```


4. **Configure TMDB API Key:**
    - Obtain an API key from [QuotesApi](https://favqs.com/api/).
    - Add the API key to your project (e.g., in a `.env` file or directly in the code).

5. **Build and Run:**
    - Run the app on an emulator or a physical device:
      ```sh
      flutter run
      ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please reach out to:

- Engineer Fred - [Your Email](mailto:engfred88@gmail.com)
- Project Link: [https://github.com/engFred/wonder-words-flutter](https://github.com/engFred/wonder-words-flutter)

## Acknowledgements

Special thanks to the developers and community behind the libraries and frameworks used in this project.



