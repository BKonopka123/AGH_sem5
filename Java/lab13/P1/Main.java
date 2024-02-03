import java.io.File;

public class Main {
    public static void main(String[] args){
        PathReader pathreader = new PathReader();
        pathreader.readPath();
        FileCopier.copyFolders(pathreader.getIn(), pathreader.getOut());
        
    }
}
