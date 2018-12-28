Métodos
=======

Métodos (_a.k.a._ "funções-membro") são funções de um objeto. Em OO, objetos
podem definir, além de atributos, funções que operam sobre eles. Por exemplo,
um objeto do tipo `User` pode precisar definir qual é o processo de renomear
tal usuário, por exemplo:

```cs
public class User {
    string name;

    public void Rename(string name) {
        // Primeiro, checa-se se o nome é um nome válido
        if (string.IsNullOrEmpty(name)) {
            throw new InvalidArgument("Username cannot be empty or null.");
        }

        this.name = name;
    }
}

static void Foo() {
    var user = new User {
        name = "Josh",
    };

    user.Rename("Carl");

    Console.WriteLine(user.name); // => Carl

    user.Rename(""); // Erro
}
```
