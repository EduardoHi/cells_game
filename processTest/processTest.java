import java.io.IOException;
import java.util.Scanner;
import java.util.*;
import java.io.*;

public class processTest{

    public static void main(String[] args){

        ArrayList<File>sources = getSources();

        Scanner scan = new Scanner(System.in);
        Thread pythonThread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    ProcessBuilder pb1 = new ProcessBuilder("python.exe", "helloworld.py" );
                    Process pro1 = pb1.start();

                    OutputStream stdin = pro1.getOutputStream ();
                    InputStream stdout = pro1.getInputStream ();

                    BufferedReader reader = new BufferedReader(new InputStreamReader(stdout));
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin));

                    String line = "";
                    while( (line = reader.readLine()) != null)
                        System.out.println(line +" ");
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } );
        Thread javaThread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    ProcessBuilder pb2 = new ProcessBuilder("java.exe", "HelloWorld" );
                    Process pro2 = pb2.start();

                    OutputStream stdin = pro2.getOutputStream ();
                    InputStream stdout = pro2.getInputStream ();

                    BufferedReader reader = new BufferedReader(new InputStreamReader(stdout));
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin));

                    String line = "";
                    while( (line = reader.readLine()) != null)
                        System.out.println(line +" ");
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } );


        pythonThread.start();
        javaThread.start();
    }

    static ArrayList<File> getSources(){
        ArrayList<File> sources = new ArrayList<>();
        File actual = new File(".");
        for( File f : actual.listFiles()){
            String filename = f.getName();
            if( filename.contains(".java") || filename.contains(".py") )
                sources.add(f);
        }
        return sources;
    }

    static void compileJava(String filename) throws IOException{
        Process pb = new ProcessBuilder("javac.exe", filename).start();
    }

}
