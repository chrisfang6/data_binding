class Command<T> {
  T data;
  String name;

  Command(this.name, this.data);
}

abstract class CommandReceiver {
  CommandReceiver handle(Command command);
}
