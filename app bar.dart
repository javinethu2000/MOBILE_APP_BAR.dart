Tuesday
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Game App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Comic Sans MS',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SettingsPage(),
    const HelpPage(),
  ];

  final List<String> _titles = [
    'Games',
    'Settings',
    'Help',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: const Color.fromARGB(255, 93, 213, 247),
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: const Color.fromARGB(255, 78, 200, 245),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.games,
                  color: _selectedIndex == 0 ? Colors.green : Colors.black87,
                  size: 28,
                ),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: _selectedIndex == 1 ? Colors.green : Colors.black87,
                  size: 28,
                ),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.help,
                  color: _selectedIndex == 2 ? Colors.green : Colors.black87,
                  size: 28,
                ),
                onPressed: () => _onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HOME PAGE - Games Section
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8F5E8), Color(0xFFF0F8FF)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              '🎮 Choose Your Game! 🎮',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  GameCard(
                    title: 'Math Fun',
                    icon: Icons.calculate,
                    color: Colors.orange,
                    onTap: () => _showGameDialog(context, 'Math Fun'),
                  ),
                  GameCard(
                    title: 'Memory Game',
                    icon: Icons.psychology,
                    color: Colors.purple,
                    onTap: () => _showGameDialog(context, 'Memory Game'),
                  ),
                  GameCard(
                    title: 'Word Puzzle',
                    icon: Icons.abc,
                    color: Colors.blue,
                    onTap: () => _showGameDialog(context, 'Word Puzzle'),
                  ),
                  GameCard(
                    title: 'Color Match',
                    icon: Icons.palette,
                    color: Colors.red,
                    onTap: () => _showGameDialog(context, 'Color Match'),
                  ),
                  GameCard(
                    title: 'Shape Sort',
                    icon: Icons.category,
                    color: Colors.teal,
                    onTap: () => _showGameDialog(context, 'Shape Sort'),
                  ),
                  GameCard(
                    title: 'Number Count',
                    icon: Icons.format_list_numbered,
                    color: Colors.indigo,
                    onTap: () => _showGameDialog(context, 'Number Count'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGameDialog(BuildContext context, String gameName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('🎉 $gameName'),
          content: Text('Ready to play $gameName? Let\'s have fun!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Here you would navigate to the actual game
              },
              child: const Text('Play Now!'),
            ),
          ],
        );
      },
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const GameCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// SETTINGS PAGE
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _soundEnabled = true;
  bool _musicEnabled = true;
  bool _vibrationsEnabled = true;
  double _gameSpeed = 2.0;
  String _difficulty = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF8DC), Color(0xFFFFE4E1)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            '⚙️ Game Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          
          // Audio Settings
          _buildSettingsSection(
            title: '🔊 Audio Settings',
            children: [
              SwitchListTile(
                title: const Text('Sound Effects'),
                subtitle: const Text('Game sounds and effects'),
                value: _soundEnabled,
                onChanged: (value) {
                  setState(() {
                    _soundEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Background Music'),
                subtitle: const Text('Game background music'),
                value: _musicEnabled,
                onChanged: (value) {
                  setState(() {
                    _musicEnabled = value;
                  });
                },
              ),
            ],
          ),

          // Game Settings
          _buildSettingsSection(
            title: '🎮 Game Settings',
            children: [
              ListTile(
                title: const Text('Difficulty Level'),
                subtitle: Text(_difficulty),
                trailing: DropdownButton<String>(
                  value: _difficulty,
                  items: ['Easy', 'Medium', 'Hard'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _difficulty = newValue!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Game Speed'),
                subtitle: Text('${_gameSpeed.toInt()}x'),
                trailing: SizedBox(
                  width: 100,
                  child: Slider(
                    value: _gameSpeed,
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    onChanged: (value) {
                      setState(() {
                        _gameSpeed = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          // Device Settings
          _buildSettingsSection(
            title: '📱 Device Settings',
            children: [
              SwitchListTile(
                title: const Text('Vibrations'),
                subtitle: const Text('Haptic feedback'),
                value: _vibrationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _vibrationsEnabled = value;
                  });
                },
              ),
            ],
          ),

          // Parent Controls
          _buildSettingsSection(
            title: '👨‍👩‍👧‍👦 Parent Controls',
            children: [
              ListTile(
                title: const Text('Parental Settings'),
                subtitle: const Text('Manage time limits and content'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showParentControlDialog(context);
                },
              ),
              ListTile(
                title: const Text('Reset Progress'),
                subtitle: const Text('Clear all game progress'),
                trailing: const Icon(Icons.refresh),
                onTap: () {
                  _showResetDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({required String title, required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 56, 123),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  void _showParentControlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('👨‍👩‍👧‍👦 Parental Controls'),
          content: const Text('This feature allows parents to set time limits and manage content. Would you like to set up parental controls?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Set Up'),
            ),
          ],
        );
      },
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('⚠️ Reset Progress'),
          content: const Text('Are you sure you want to reset all game progress? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}

// HELP PAGE
class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE6F3FF), Color(0xFFF0F8FF)],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            '❓ Help & Guide',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          _buildHelpSection(
            title: '🎮 Game Structure',
            content: '''
Our app contains 6 exciting games designed for kids:

    Math Fun: Learn numbers and basic arithmetic
    Memory Game: Improve memory and concentration
    Word Puzzle: Build vocabulary and spelling skills
    Color Match: Learn colors and pattern recognition
    Shape Sort: Understand shapes and sorting
    Number Count: Practice counting and number recognition


Each game has multiple levels that get progressively challenging!
            ''',
          ),

          _buildHelpSection(
            title: '📋 How to Play',
            content: '''

    Tap on any game card from the Home screen
    Read the instructions that appear
    Start playing by following the on-screen prompts
    Earn stars and unlock new levels
    Use the back button to return to game selection


Tips for Parents:

    Play together with your child
    Encourage them when they make progress
    Use the settings to adjust difficulty
    Set appropriate time limits

            ''',
          ),

          _buildHelpSection(
            title: '⚙️ Settings Guide',
            content: '''
Audio Settings:

    Toggle sound effects on/off
    Control background music


Game Settings:

    Choose difficulty level (Easy/Medium/Hard)
    Adjust game speed (1x to 5x)


Parent Controls:

    Set time limits for gameplay
    Reset all progress if needed
    Manage content accessibility

            ''',
          ),

          _buildHelpSection(
            title: '🏆 Scoring System',
            content: '''

    ⭐ 1 Star: Complete the level
    ⭐⭐ 2 Stars: Complete with few mistakes
    ⭐⭐⭐ 3 Stars: Perfect completion!


Collect stars to unlock:

    New game levels
    Special achievements
    Fun animations and sounds

            ''',
          ),

          _buildHelpSection(
            title: '📞 Need More Help?',
            content: '''
If you need additional support:

    Check our FAQ section (coming soon)
    Contact our support team
    Visit our website for tutorials


Remember: This app is designed to be fun and educational. Take breaks and enjoy learning!
            ''',
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection({required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 44, 88),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
