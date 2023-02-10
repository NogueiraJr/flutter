import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:ocstapi/model/usuario_model.dart';

enum MailType { cadastro, novaSenha, cadastroFilho }

class EmailUtils {
  void message(MailType tipo, UsuarioModel usuario) async {
    const String username = 'ocstappmail@gmail.com';
    const String password = 'L:?LYBrEOp9bEL;:3@Up2F';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.

    final message = Message()
      ..from = Address(username, 'OCSTApp')
      ..recipients.add(usuario.email /*'anogueirajr@gmail.com'*/)
      //..ccRecipients
      //    .addAll(['nogueirajr@hotmail.com' /*, 'destCc2@example.com'*/])
      //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'OCSTApp 😀'
      //..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = """
        <h1>Falta pouco!</h1>\n\n
        <p>Digite o código abaixo no seu App:</p>\n\n
        \t<h1>${usuario.codigo.toString().padLeft(4, '0')}</h1>\n\n
        <p>Obrigado!</p>\n\n
        Equipe OCSTApp 😀
        """;
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport.toString()');
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE

    // Let's send another message using a slightly different syntax:
    //
    // Addresses without a name part can be set directly.
    // For instance `..recipients.add('destination@example.com')`
    // If you want to display a name part you have to create an
    // Address object: `new Address('destination@example.com', 'Display name part')`
    // Creating and adding an Address object without a name part
    // `new Address('destination@example.com')` is equivalent to
    // adding the mail address as `String`.

//    final equivalentMessage = Message()
//      ..from = Address(username, 'OCSTApp B')
//      ..recipients.add(Address('anogueirajr@gmail.com'))
//      ..ccRecipients.addAll(
//          [Address('nogueirajr@hotmail.com') /*, 'destCc2@example.com'*/])
//      //..bccRecipients.add('bccAddress@example.com')
//      ..subject =
//          'OCSTApp B :: Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
//      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
//      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

//    final sendReport2 = await send(equivalentMessage, smtpServer);

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
//    final connection = PersistentConnection(smtpServer);

    // Send the first message
//    await connection.send(message);

    // send the equivalent message
//    await connection.send(equivalentMessage);

    // close the connection
//    await connection.close();
  }
}
