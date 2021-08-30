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
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    // Tratamento para não adicionar mais de um caractere ponto no display
    if (isDot && _value.contains('.') && !wipeValue) return;

    final emptyValue = isDot ? '0' : '';

    // Se a UI estiver limpando a tela, e o caractere a ser adicionado for um ponto, atribui zero ao display para evitar
    //  o problema onde o ponto aparece no início do display
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    // Convertendo o valor obtido para número e transferindo para o buffer
    // Se por algum motivo não dor possível fazer o parse do valor obtido para número, o valor é 0
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void _clearAll() {
    _value = '0';
  }
}
