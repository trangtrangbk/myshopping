package define;

import org.apache.commons.io.FilenameUtils;

public class FileDefine {
	public static final String DIR_UPLOAD = "WEB-INF/uploads";
	public static String rename(String filename) {
		return FilenameUtils.getBaseName(filename)+"-"+System.nanoTime()+"." + FilenameUtils.getExtension(filename);
	}
}
