import 'dart:math';

class PreferenceService {
  static final PreferenceService _instance = PreferenceService._internal();
  factory PreferenceService() => _instance;
  PreferenceService._internal();

  // Sample quotes for different categories
  final Map<String, List<Map<String, String>>> _categoryQuotes = {
    'Meditation & Mindfulness': [
      {
        'quote': 'The present moment is the only time over which we have dominion.',
        'author': 'Thich Nhat Hanh'
      },
      {
        'quote': 'Wherever you are, be there totally.',
        'author': 'Eckhart Tolle'
      },
      {
        'quote': 'Peace comes from within. Do not seek it without.',
        'author': 'Buddha'
      },
    ],
    'Exercise & Fitness': [
      {
        'quote': 'Take care of your body. It\'s the only place you have to live.',
        'author': 'Jim Rohn'
      },
      {
        'quote': 'The groundwork for all happiness is good health.',
        'author': 'Leigh Hunt'
      },
      {
        'quote': 'Fitness is not about being better than someone else. It\'s about being better than you used to be.',
        'author': 'Khloe Kardashian'
      },
    ],
    'Nutrition & Diet': [
      {
        'quote': 'Let food be thy medicine and medicine be thy food.',
        'author': 'Hippocrates'
      },
      {
        'quote': 'Your diet is a bank account. Good food choices are good investments.',
        'author': 'Bethenny Frankel'
      },
      {
        'quote': 'Eating well is a form of self-respect.',
        'author': 'Unknown'
      },
    ],
    'Sleep & Recovery': [
      {
        'quote': 'Sleep is the best meditation.',
        'author': 'Dalai Lama'
      },
      {
        'quote': 'Rest when you\'re weary. Refresh and renew yourself.',
        'author': 'Ralph Marston'
      },
      {
        'quote': 'Sleep is the golden chain that ties health and our bodies together.',
        'author': 'Thomas Dekker'
      },
    ],
    'Mental Health': [
      {
        'quote': 'Mental health is not a destination, but a process.',
        'author': 'Noam Shpancer'
      },
      {
        'quote': 'Your mental health is a priority. Your happiness is essential.',
        'author': 'Unknown'
      },
      {
        'quote': 'It\'s okay to not be okay as long as you are not giving up.',
        'author': 'Karen Salmansohn'
      },
    ],
    'Stress Management': [
      {
        'quote': 'You have power over your mind - not outside events. Realize this, and you will find strength.',
        'author': 'Marcus Aurelius'
      },
      {
        'quote': 'Stress is caused by being \'here\' but wanting to be \'there\'.',
        'author': 'Eckhart Tolle'
      },
      {
        'quote': 'Don\'t let yesterday take up too much of today.',
        'author': 'Will Rogers'
      },
    ],
    'Yoga & Stretching': [
      {
        'quote': 'Yoga is a journey of the self, through the self, to the self.',
        'author': 'The Bhagavad Gita'
      },
      {
        'quote': 'The success of yoga does not lie in the ability to attain the perfect posture but in how it brings positive changes into a person\'s life.',
        'author': 'Unknown'
      },
      {
        'quote': 'Yoga is not about touching your toes. It is about what you learn on the way down.',
        'author': 'Judith Hanson Lasater'
      },
    ],
    'Motivational Quotes': [
      {
        'quote': 'Your wellness is an investment, not an expense.',
        'author': 'Unknown'
      },
      {
        'quote': 'Believe you can and you\'re halfway there.',
        'author': 'Theodore Roosevelt'
      },
      {
        'quote': 'The only way to do great work is to love what you do.',
        'author': 'Steve Jobs'
      },
    ],
  };

  // Default quote for when no preferences are set
  final Map<String, String> _defaultQuote = {
    'quote': 'Your wellness is an investment, not an expense.',
    'author': 'Unknown'
  };

  // Get a random quote based on user preferences
  Map<String, String> getTodaysQuote(List<String> userPreferences) {
    if (userPreferences.isEmpty) {
      return _defaultQuote;
    }

    // Get a random preference from user's selected categories
    final random = Random();
    final randomPreference = userPreferences[random.nextInt(userPreferences.length)];
    
    // Get quotes for that category
    final categoryQuotes = _categoryQuotes[randomPreference];
    if (categoryQuotes == null || categoryQuotes.isEmpty) {
      return _defaultQuote;
    }

    // Return a random quote from that category
    return categoryQuotes[random.nextInt(categoryQuotes.length)];
  }

  // Get all quotes for a specific category
  List<Map<String, String>> getQuotesForCategory(String category) {
    return _categoryQuotes[category] ?? [];
  }

  // Get all available categories
  List<String> getAllCategories() {
    return _categoryQuotes.keys.toList();
  }

  // Health tips based on categories
  final Map<String, List<Map<String, String>>> _categoryHealthTips = {
    'Meditation & Mindfulness': [
      {
        'title': 'Start with 5 Minutes',
        'description': 'Begin your meditation practice with just 5 minutes daily and gradually increase the duration.'
      },
      {
        'title': 'Focus on Your Breath',
        'description': 'Use breathing as an anchor when your mind wanders during meditation.'
      },
    ],
    'Exercise & Fitness': [
      {
        'title': 'Move Every Hour',
        'description': 'Take a 2-minute movement break every hour to boost circulation and energy.'
      },
      {
        'title': 'Start Small',
        'description': 'Begin with 10-15 minutes of exercise daily and build up gradually.'
      },
    ],
    'Nutrition & Diet': [
      {
        'title': 'Hydrate First',
        'description': 'Start your day with a glass of water before your morning coffee or tea.'
      },
      {
        'title': 'Colorful Plates',
        'description': 'Aim for a variety of colorful fruits and vegetables in your meals.'
      },
    ],
    'Sleep & Recovery': [
      {
        'title': 'Digital Sunset',
        'description': 'Stop using screens 1 hour before bedtime for better sleep quality.'
      },
      {
        'title': 'Consistent Schedule',
        'description': 'Go to bed and wake up at the same time every day, even on weekends.'
      },
    ],
    'Mental Health': [
      {
        'title': 'Practice Gratitude',
        'description': 'Write down 3 things you\'re grateful for each day.'
      },
      {
        'title': 'Connect with Others',
        'description': 'Reach out to a friend or family member regularly for social connection.'
      },
    ],
    'Stress Management': [
      {
        'title': 'Breathe to Reset',
        'description': 'Use the 4-7-8 breathing technique: inhale for 4, hold for 7, exhale for 8.'
      },
      {
        'title': 'Time in Nature',
        'description': 'Spend at least 20 minutes outdoors daily to reduce stress hormones.'
      },
    ],
  };

  // Get health tips based on user preferences
  List<Map<String, String>> getHealthTipsForPreferences(List<String> userPreferences) {
    List<Map<String, String>> tips = [];
    
    for (String preference in userPreferences) {
      final categoryTips = _categoryHealthTips[preference];
      if (categoryTips != null) {
        tips.addAll(categoryTips);
      }
    }

    // If no specific tips found, return default tip
    if (tips.isEmpty) {
      tips.add({
        'title': 'Breathe to Reset',
        'description': 'Use the 4-7-8 breathing technique: inhale for 4, hold for 7, exhale for 8.'
      });
    }

    return tips;
  }
}
