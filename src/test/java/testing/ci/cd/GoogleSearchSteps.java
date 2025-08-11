package testing.ci.cd;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class GoogleSearchSteps {

    private WebDriver driver;

    @Given("I am on the Millanel Resistencia page")
    public void i_am_on_the_google_search_page() {
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-dev-shm-usage");
        driver = new ChromeDriver(options);
        driver.get("https://millanel-resistencia.com/");
        driver.findElement(By.cssSelector("button[class*=\"bg-primary\"]")).click();
    }

    @When("I search for {string}")
    public void i_search_for(String query) {
        WebElement searchBox = driver.findElement(By.cssSelector("input[type=\"search\"]"));
        searchBox.sendKeys(query);
    }

    @Then("I found the item searched")
    public void i_found_searched_item() {
        assertTrue(driver.getTitle().contains("Millanel Resistencia"));
        driver.quit();
    }
}
