/**
 * Copyright (c) 2015 Company.
 * All rights reserved.
 */
package com.mycompany.exercises.net.ftp;

public final class FTPLauncher {

  private FTPLauncher() {}

  public static void main(final String[] args) {
    FTPConnectionProperties ftpProperties =
        new FTPConnectionProperties.Builder("ftp.gnu.org").directory(
            "third-party").build();
    MyFTPClient ftpClient = new MyFTPClient();

    ftpClient.obtainListOfFileInformationAnonymous(ftpProperties).stream()
            .forEach(file -> System.out.println(String.valueOf(file)));
  }
}
