

class Endpoint {

  static const String registro = "https://api-python-1-k4m2.onrender.com/register/";
  static const String login = "https://api-python-1-k4m2.onrender.com/login/";
  static const String abrirTicket = "https://api-python-1-k4m2.onrender.com/tickets/";
  static const String listarTicket = "https://api-python-1-k4m2.onrender.com/listar/";
  static const String listatUsuario = "https://api-python-1-k4m2.onrender.com/me";
  static String editarTicket(int id) => "https://api-python-1-k4m2.onrender.com/tickets/$id";
  static String deletarTicket(int id) => "https://api-python-1-k4m2.onrender.com/tickets/$id";

}