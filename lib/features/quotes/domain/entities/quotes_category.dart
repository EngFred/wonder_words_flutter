enum QuoteCategory {
  all,
  life,
  happiness,
  family,
  love,
  success,
  friendship,
  wisdom
}

extension QuoteCategoryExtension on QuoteCategory {
  String get displayName {
    switch (this) {
      case QuoteCategory.all:
        return 'All';
      case QuoteCategory.life:
        return 'Life';
      case QuoteCategory.happiness:
        return 'Happiness';
      case QuoteCategory.family:
        return 'Family';
      case QuoteCategory.love:
        return 'Love';
      case QuoteCategory.success:
        return 'Success';
      case QuoteCategory.friendship:
        return 'Friendship';
      case QuoteCategory.wisdom:
        return 'Wisdom';
      default:
        return '';
    }
  }

  String get queryParam {
    return this == QuoteCategory.all ? '' : displayName.toLowerCase();
  }
}
