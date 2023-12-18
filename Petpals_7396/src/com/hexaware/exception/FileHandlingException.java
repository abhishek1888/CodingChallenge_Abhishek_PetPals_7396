package com.hexaware.exception;
import java.io.FileNotFoundException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class FileHandlingException extends Exception{
	public FileHandlingException(String message) {
		super(message);
	}
}