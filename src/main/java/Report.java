import java.io.*;
import java.util.*;
import java.util.List;
import net.masterthought.cucumber.*;

/**
 * Created by Oscar Tapia on 6/9/16.
 */
public class Report {

    public static void main(String[] args)
    {
        File reportOutputDirectory = new File("ReportHTMLResults");
        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add("result.json");
        //jsonFiles.add("cucumber-report-2.json");

        String jenkinsBasePath = "";
        String buildNumber = "1";
        String projectName = "Truextend Mobile Automation";
        boolean skippedFails = true;
        boolean pendingFails = false;
        boolean undefinedFails = true;
        boolean missingFails = true;
        boolean runWithJenkins = false;
        boolean parallelTesting = false;

        Configuration configuration = new Configuration(reportOutputDirectory, projectName);
        // optionally only if you need
        configuration.setStatusFlags(skippedFails, pendingFails, undefinedFails, missingFails);
        configuration.setParallelTesting(parallelTesting);
        configuration.setJenkinsBasePath(jenkinsBasePath);
        configuration.setRunWithJenkins(runWithJenkins);
        configuration.setBuildNumber(buildNumber);

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        reportBuilder.generateReports();
    }
}