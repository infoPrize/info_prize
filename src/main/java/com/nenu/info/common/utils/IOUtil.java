package com.nenu.info.common.utils;

/**
 * IOUtil
 *
 * @author zhaiaxin
 * @time: 2017/12/7 20:45.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class IOUtil {
    public static final String CLASSPATH = "classpath:";

    public IOUtil() {
    }

    public static File getFile(String path) {
        File file = null;
        URL url = null;
        if(path.startsWith("classpath:")) {
            path = path.substring("classpath:".length());
            url = getClassLoader().getResource(path);
            final boolean fileExist = url != null;

            try {
                path = url != null?URLDecoder.decode(url.getPath(), "UTF-8"):path;
            } catch (Exception var5) {
                var5.printStackTrace();
            }

            path = path.replaceAll("%20", " ");
            file = new File(path) {
                private static final long serialVersionUID = 4009013298629147887L;

                public boolean exists() {
                    return fileExist;
                }
            };
        } else {
            file = new File(path);
        }

        return file;
    }

    private static ClassLoader getClassLoader() {
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        if(loader == null) {
            loader = IOUtil.class.getClassLoader();
        }

        return loader;
    }

    public static List<File> getFiles(String dirPath, String prefix, String suffix) {
        File dir = getFile(dirPath);
        if(dir.isFile()) {
            return Collections.emptyList();
        } else {
            List<File> fileList = new ArrayList();
            String filename = "";
            File[] var6 = dir.listFiles();
            int var7 = var6.length;

            for(int var8 = 0; var8 < var7; ++var8) {
                File file = var6[var8];
                if(file.isFile()) {
                    filename = file.getName();
                    if(filename.startsWith(prefix) && filename.endsWith(suffix)) {
                        fileList.add(file);
                    }
                }
            }

            return fileList;
        }
    }

    public static InputStream getFileAsStream(String path) {
        if(path.startsWith("classpath:")) {
            path = path.substring("classpath:".length());
            return getClassLoader().getResourceAsStream(path);
        } else {
            try {
                return new FileInputStream(path);
            } catch (FileNotFoundException var2) {
                var2.printStackTrace();
                throw new RuntimeException(var2);
            }
        }
    }
}
