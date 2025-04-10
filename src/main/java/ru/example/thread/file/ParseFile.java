package ru.example.thread.file;

import java.io.*;
import java.util.function.Predicate;

public final class ParseFile {

    private final File file;

    public ParseFile(File file) {
        this.file = file;
    }

    public synchronized String getContent()  {
        return content(character -> true);
    }

    public synchronized String getContentWithoutUnicode() {
        return content(character -> character < 0x80);
    }

    private String content(Predicate<Character> filter){
        StringBuilder output = new StringBuilder();
        try (InputStream input = new BufferedInputStream(new FileInputStream(file))) {
             int data;
            while ((data = input.read()) != -1) {
                output.append((char) data);
            }
            if (filter.test((char) data)) {
                output.append((char) data);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return output.toString();
    }
}