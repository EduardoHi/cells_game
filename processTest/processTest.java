import java.io.IOException;
import java.util.Scanner;

public class processTest{

    public static void main(String[] args){

        try{
            System.out.println("Trying to compile and run...");

            ProcessBuilder pb = new ProcessBuilder("javac.exe", "HelloWorld.java");
            pb.inheritIO();

            Process comp = pb.start();
            System.out.println("compile succesful");

            pb = new ProcessBuilder("java.exe", "HelloWorld" );

            Process p = pb.start();

            Scanner s = new Scanner(p.getInputStream());
           while(s.hasNext())
               System.out.print(s.next()+" ");
           s.close();

            System.out.println("\nrun succesful");
        }
        catch(IOException e){
            e.printStackTrace();
        }

    }

}
