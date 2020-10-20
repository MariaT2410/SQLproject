import org.flywaydb.core.Flyway;

public class Main {
    public static void main(String[] args){

        final Flyway fly = Flyway.configure()
                .dataSource("jdbc:postgresql://127.0.0.1:5432/base1", "postgres", "2410" )
                .locations("db")
                .load();
        fly.clean();
        fly.migrate();
        System.out.println("Hello");
    }
}
