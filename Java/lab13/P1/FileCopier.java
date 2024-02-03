import java.io.File;
import java.nio.file.Path;

public class FileCopier {
    public static void copyFolders(Path inputDirectoryPath, Path outputDirectoryPath) {
        File inputDirectory = new File(inputDirectoryPath.toString());
        File[] folders = inputDirectory.listFiles(File::isDirectory);

        if (folders != null) {
            for (File folder : folders) {
                String folderName = folder.getName();
                String outputFolderPath = outputDirectoryPath + File.separator + folderName;

                File outputFolder = new File(outputFolderPath.toString());
                outputFolder.mkdirs();
            }
        }
    }
}

