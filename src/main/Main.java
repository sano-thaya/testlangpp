import java.io.FileReader;
import lexer.TestLangLexer;
import parser.Parser;

public class Main {
    public static void main(String[] args) throws Exception {

        FileReader reader = new FileReader("input.test");

        TestLangLexer lexer = new TestLangLexer(reader);
        Parser parser = new Parser(lexer);

        parser.parse();

        System.out.println("Parsing completed successfully");
    }
}
