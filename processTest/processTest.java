import java.io.IOException;
import java.util.Scanner;
import java.util.*;
import java.io.*;

public class processTest{

    static void threadMessage(String message) {
        String threadName = Thread.currentThread().getName();
        System.out.format("%s: %s%n",
                          threadName,
                          message);
    }

    public static class OutSideProgram implements Runnable {
        String type, filename;
        boolean threadDone = false;
        BufferedReader reader;
        BufferedWriter writer;
        OutSideProgram(String t, String f){
            type = t;
            filename = f;
        }

        public void run() {
            Thread thisThread = Thread.currentThread();

            try {

                ProcessBuilder pb1 = new ProcessBuilder(type , filename );
                Process pro1 = pb1.start();

                OutputStream stdin = pro1.getOutputStream ();
                InputStream stdout = pro1.getInputStream ();

                reader = new BufferedReader(new InputStreamReader(stdout));
                writer = new BufferedWriter(new OutputStreamWriter(stdin));

                String line = "";
                while( (line = reader.readLine()) != null){
                    threadMessage(line);
                    try{
                        thisThread.sleep(4000);
                    } catch( InterruptedException ie){
                        ie.printStackTrace();
                    }
                }
                reader.close();

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public static void main(String[] args) throws InterruptedException{

        ArrayList<File>sources = getSources();
        try{
            compileCpp("hello_world.cpp");
        } catch (IOException ioe){
            ioe.printStackTrace();
        }


        Thread pythonThread = new Thread(new OutSideProgram("python.exe", "helloworld.py") );
        Thread javaThread = new Thread(new OutSideProgram("java.exe", "HelloWorld") );
        Thread cppThread = new Thread(new OutSideProgram("hello_world", "") );

        pythonThread.start();
        javaThread.start();
        cppThread.start();

        while (pythonThread.isAlive() || javaThread.isAlive() || cppThread.isAlive() ) {
            threadMessage("main turn");
        }


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
    static void compileCpp(String filename) throws IOException{
        String outputFile = filename.substring(0,filename.indexOf('.'));
        System.out.println(outputFile +" "+ filename);
        Process pb = new ProcessBuilder("g++ ", "-o "+ outputFile + " " + filename).start();
    }

}
