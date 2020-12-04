package com.csis3275.blackboxTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class PermissionTest {
	
	
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
  public void setUp() {
	System.setProperty("webdriver.chrome.driver", "c:/temp/chromedriver.exe");
    driver = new ChromeDriver();
    driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    driver.quit();
  }
  @Test
  public void permission() throws InterruptedException {
    driver.get("http://localhost:8080/login");
    driver.manage().window().setSize(new Dimension(1936, 1056));
    driver.findElement(By.id("id")).click();
    driver.findElement(By.id("id")).sendKeys("min");
    driver.findElement(By.cssSelector(".text-center:nth-child(2)")).click();
    driver.findElement(By.id("password")).click();
    driver.findElement(By.id("password")).sendKeys("123");
    driver.findElement(By.cssSelector(".btn")).click();
    Thread.sleep(1000);
    driver.findElement(By.id("id")).click();
    driver.findElement(By.id("id")).sendKeys("admin");
    driver.findElement(By.id("password")).click();
    driver.findElement(By.id("password")).sendKeys("123");
    driver.findElement(By.cssSelector(".btn")).click();
    Thread.sleep(1000);
    driver.findElement(By.linkText("Admin Page")).click();
    Thread.sleep(1000);
    driver.findElement(By.cssSelector(".table:nth-child(5) tr:nth-child(1) .btn")).click();
    Thread.sleep(1000);
    driver.findElement(By.xpath("//*[@id=\"sidebar\"]/ul[2]/li")).click();
    Thread.sleep(1000);
    driver.findElement(By.id("id")).click();
    driver.findElement(By.id("id")).clear();
    driver.findElement(By.id("id")).sendKeys("min");
    driver.findElement(By.id("password")).sendKeys("123");
    driver.findElement(By.cssSelector(".btn")).click();
    assertThat(driver.findElement(By.xpath("//h2[contains(.,\'Home\')]")).getText(), is("Home"));
  }
}
