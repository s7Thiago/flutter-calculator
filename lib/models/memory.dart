class Memory {
  String _value = '0';

  String get value => _value;

  void applyCommand(String command) {
    if (command == 'AC') {
      _clearAll();
    } else {
      _value += command;
    }
  }

  void _clearAll() {
    _value = '0';
  }
}
