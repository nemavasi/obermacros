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
            body =  "MODULE test; \n" +
            "IMPORT JS;\n" +
            "BEGIN\n" +
            "JS.alert(\"Hello, World!\")\n" +
            "END test.\n"
            ;
        }
        //body = getBaseModulesSourceText() + body;
        result = result.replace("__MY_CODE__", body);

//        Integer width, height;
//        try {
//            width = Integer.valueOf(map.get("width"));
//            height = Integer.valueOf(map.get("height"));
//        } catch (NumberFormatException e) {
//            throw new RuntimeException("wrong number!");
//        }

//        String output = "<div class =\"helloworld\">";
//        output = output + "<div class = \"" + map.get("Color") + "\">";
//        if (map.get("Name") != null) {
//            output = output + ("<h1>Hello " + map.get("Name") + "!</h1>");
//        } else {
//            output = output + "<h1>Hello World!<h1>";
//            output += "<br>" + conversionContext.;
//        }
//        output = output + "</div>" + "</div>";
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

    //    @Override
//    public boolean hasBody() {
//        return true;
//    }
//
//    @Override
//    public RenderMode getBodyRenderMode() {
//        return null;
//    }
//
//    @Override
//    public String execute(Map map, String s, RenderContext renderContext) throws MacroException {
//
//        pageBuilderService.assembler().resources().requireWebResource("nemavasi.confluence.obermacros:ober-macro");
//
//        String output = "<div class =\"helloworld\">";
//        output = output + "<div class = \"" + map.get("Color") + "\">";
//        if (map.get("Name") != null) {
//            output = output + ("<h1>Hello " + map.get("Name") + "!</h1>");
//        } else {
//            output = output + "<h1>Hello World!<h1>";
//        }
//        output = output + "</div>" + "</div>";
//        return output;
//    }
//
//    @Override
//    public boolean suppressSurroundingTagDuringWysiwygRendering() {
//        return false;
//    }
//
//    @Override
//    public boolean suppressMacroRenderingDuringWysiwyg() {
//        return false;
//    }
//
//    @Override
//    public WysiwygBodyType getWysiwygBodyType() {
//        return null;
//    }
}
