class Memory {
  // Contém uma lista constante com todos as operações suportadas pela calculadora
  static const operations = ['%', '/', 'x', '-', '+', '='];

  // Armazena dois valores envolvidos em uma operação matemática
  // Vai acessar e armazenar os valores do display em formato numérico aqui
  final _buffer = [0.0, 0.0];

  // Serve para indicar qual dos dois valores do buffer está sendo digitado
  int _bufferIndex = 0;

  // Armazena a operação atual
  String? _operation = '';
  String _value = '0';
  bool _wipeValue = false;

  // Controla qual foi o último operador recebido pela calculadora para evitar o problema onde
  // o usuário não podia trocar de operação ao clicar em um operador diferente do último
  String _lastCommand = '';

  String get value => _value;

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      // Quando o usuário clica em AC, limpa a tela
      _clearAll();
    } else if (operations.contains(command)) {
      // Se o comando passado está na lista de operações suportadas
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  // Verifica se o usuário está substituindo a operação
  _isReplacingOperation(String command) {
    // Se o comando anterior e o atual são suportados
    // E os dois últimos comandos são diferentes de =
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    // Após inserir um caractere de operação, o valor do índice do buffer é atualizado
    // caso ainda esteja referenciando a primeira posição do buffer
    if (_bufferIndex == 0) {
      // Evita o problema onde ao digitar um elemento e o primeiro operador é o =
      // era passado um valor inválido para o segundo elemento do buffer
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      // Se o índice do buffer for 1, significa que o usuário já digitou um valor
      // desse modo, o valor do buffer[0] é atualizado com o resultado da operação
      // e o buffer[1] é zerado
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;

      // Exibindo o resultado no display
      _value = _buffer[0].toString();

      // Quando o valor no display é inteiro, não exibe o ponto decimal
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true; //* !isEqualSign;
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
    _buffer.setAll(0, [0.0, 0.0]);
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
