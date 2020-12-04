package com.csis3275.blackboxTest;


// Generated by Selenium IDE
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class AddCourseTest {
	private WebDriver driver;
	private Map<String, Object> vars;
	JavascriptExecutor js;
	  @Before
	  public void setUp() {
		  System.setProperty("webdriver.chrome.driver", "c:/temp/chromedriver.exe");
			driver = new ChromeDriver();
			
			//Wait at least 10 seconds for each page load
			driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
			
			js = (JavascriptExecutor) driver;
			vars = new HashMap<String, Object>();
	    
	  }
	  @After
	  public void tearDown() {
	    driver.quit();
	  }
	@Test
	public void addCourseTest() throws InterruptedException {
		driver.get("http://localhost:8080/login");
		driver.manage().window().setSize(new Dimension(1600, 900));
		driver.findElement(By.id("id")).click();
	    driver.findElement(By.id("id")).sendKeys("test");
	    Thread.sleep(1000);
		driver.findElement(By.id("password")).click();
		driver.findElement(By.id("password")).sendKeys("123");
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".btn")).click();
		Thread.sleep(1000);
		driver.findElement(By.linkText("Add Course")).click();
		Thread.sleep(1000);
		driver.findElement(By.id("courseName")).click();
		Thread.sleep(1000);
		driver.findElement(By.id("courseName")).click();
		Thread.sleep(1000);
		driver.findElement(By.id("courseName")).sendKeys("Course Test");
		Thread.sleep(1000);
		driver.findElement(By.id("courseShortName")).sendKeys("CSIS 1100");
		Thread.sleep(1000);
		driver.findElement(By.id("startDate")).click();
		Thread.sleep(1000);
		driver.findElement(By.id("startDate")).sendKeys("2020-11-29");
		Thread.sleep(1000);
		driver.findElement(By.id("endDate")).click();
		Thread.sleep(1000);
		driver.findElement(By.id("endDate")).sendKeys("2020-12-16");
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".btn-primary")).click();
		
	}
}
