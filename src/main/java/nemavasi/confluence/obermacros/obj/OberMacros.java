package nemavasi.confluence.obermacros.obj;

import com.atlassian.confluence.content.render.xhtml.ConversionContext;
import com.atlassian.confluence.macro.Macro;
import com.atlassian.confluence.macro.MacroExecutionException;
import com.atlassian.confluence.setup.BootstrapManager;
import com.atlassian.plugin.spring.scanner.annotation.imports.ComponentImport;
import com.atlassian.webresource.api.assembler.PageBuilderService;
import nemavasi.confluence.obermacros.api.WithBaseModules;

import javax.inject.Inject;
import javax.inject.Named;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

@Named
public class OberMacros implements Macro, WithBaseModules {

    private PageBuilderService pageBuilderService;
    private  BootstrapManager bootstrapManager;

    @Inject
    public OberMacros(@ComponentImport BootstrapManager bootstrapManager, @ComponentImport PageBuilderService pageBuilderService) {
        this.pageBuilderService = pageBuilderService;
        this.bootstrapManager = bootstrapManager;
    }

    @Override
    public String getBaseModulesSourceText() {

        InputStream modMath = OberMacros.class.getClassLoader().getResourceAsStream("modules/Math.Mod");
        InputStream modString = OberMacros.class.getClassLoader().getResourceAsStream("modules/Strings.Mod");
        InputStream modLog = OberMacros.class.getClassLoader().getResourceAsStream("modules/Log.Mod");
        InputStream modDraw = OberMacros.class.getClassLoader().getResourceAsStream("modules/Draw.Mod");

        StringBuilder output = new StringBuilder();

        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(modMath))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
                output.append("\n");
            }
            output.append("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(modString))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
                output.append("\n");
            }
            output.append("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(modLog))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
                output.append("\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(modDraw))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
                output.append("\n");
            }
            output.append("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return output.toString();
    }

    @Override
    public String execute(Map<String, String> map, String body, ConversionContext conversionContext) throws MacroExecutionException {

        pageBuilderService.assembler().resources().requireWebResource("nemavasi.confluence.obermacros:ober-macro");

        StringBuilder output = new StringBuilder();
        InputStream is = OberMacros.class.getClassLoader().getResourceAsStream("templates/ober.vm");


        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(is))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        String baseURL = bootstrapManager.getBaseUrl();

        String result = output.toString();
        result = result.replace("__ATLASSIAN_BASE_URL__", baseURL);

        if (body == null || body.trim().length() == 0) {
//            body =  "MODULE test; \n" +
//            "IMPORT JS;\n" +
//            "BEGIN\n" +
//            "JS.alert(\"Hello, World!\")\n" +
//            "END test.\n"
//            ;

            body = getExampleText();
        }
        result = result.replace("__MY_CODE__", body);
        return result;
    }

    @Override
    public BodyType getBodyType() {
        return BodyType.PLAIN_TEXT;
    }

    @Override
    public OutputType getOutputType() {
        return OutputType.BLOCK;
    }

    @Override
    public String getExampleText(){
        StringBuilder output = new StringBuilder();
        InputStream modExample = OberMacros.class.getClassLoader().getResourceAsStream("modules/Init.Mod");

        try (BufferedReader buffer = new BufferedReader(new InputStreamReader(modExample))) {
            String strCurrentLine;
            while ((strCurrentLine = buffer.readLine()) != null) {
                output.append(strCurrentLine);
                output.append("\n");
            }
            output.append("\n");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return output.toString();
    }
}
