class Memory {
  // Contém uma lista constante com todos as operações suportadas pela calculadora
  static const operations = ['%', '/', 'x', '-', '+', '='];

  // Armazena dois valores envolvidos em uma operação matemática
  // Vai acessar e armazenar os valores do display em formato numérico aqui
  final _buffer = [0.0, 0.0];

  // Serve para indicar qual dos dois valores do buffer está sendo digitado
  int _bufferIndex = 0;

  // Armazena a operação atual
  String operation = '';
  String _value = '0';
  bool _wipeValue = false;

  String get value => _value;

  void applyCommand(String command) {
    if (command == 'AC') {
      // Quando o usuário clica em AC, limpa a tela
      _clearAll();
    } else if (operations.contains(command)) {
      // Se o comando passado está na lista de operações suportadas
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  _setOperation(String newOperation) {
    _wipeValue = true;
  }

  _addDigit(String digit) {
    // Se no display tem apenas zero, e um caractere é digitado, o zero é substituído por esse caractere
    final wipeValue = _value == '0' || _wipeValue;
    final currentValue = wipeValue ? '' : _value;

    // Conta quantos caracteres ponto tem no display
    int contDots = 0;
    for (int i = 0; i < _value.length; i++) {
      if (_value[i] == '.') contDots++;
    }

    // Tratamento para não adicionar mais de um ponto no display
    if (digit != '.') {
      _value = currentValue + digit;
    } else if (contDots == 0) {
      _value = currentValue + digit;
    }

    _wipeValue = false;
  }

  void _clearAll() {
    _value = '0';
  }
}
