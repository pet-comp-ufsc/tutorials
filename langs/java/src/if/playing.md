Brincando com o código
----------------------

Salve o código abaixo como "PlayWithIf.java" e altere-o da forma que quiser,
compilando e vendo como o programa se comporta:

```java
public class PlayWithIf {
    public static void main(String[] args) {
        var x = 0;
        var y = 10;

        if (x < y) {
            System.out.println(x + " is less than " + y);
        } else if (x > y) {
            System.out.println(x + " is greater than " + y);
        } else {
            System.out.println(x + " and " + y + " are equal");
        }

        var student1 = "Arthur";
        var student2 = "arthur";

        if (student1.equals(student2)) {
            System.out.println("Both students have the same name");
        } else {
            System.out.println("Something is different with these students.");
            if (student1.equalsIgnoreCase(student2)) {
                System.out.println("Oh yeah, they have different cases.");
            } else {
                System.out.println("And it's mostly everything.");
            }
        }
    }
}
```

Tente, por exemplo, ver o que acontece quando a ordem dos `if`s é alterada, ou
alterar as condições, ou mesmo quebrar os `if-else` em vários `if`s separados.
