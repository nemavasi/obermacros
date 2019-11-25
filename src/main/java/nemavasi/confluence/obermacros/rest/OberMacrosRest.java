package nemavasi.confluence.obermacros.rest;

import com.atlassian.plugins.rest.common.security.AnonymousAllowed;
import nemavasi.confluence.obermacros.obj.OberMacros;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


//rest/obermacros_plugin/1.0/obermacros/help
@Path("/obermacros")
public class OberMacrosRest {

    protected OberMacros oberMacros;

    @Inject
    public OberMacrosRest(OberMacros oberMacros){
        this.oberMacros = oberMacros;
    }

    @GET
    @AnonymousAllowed
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/help")
    public Response getCutFIOPadegFS() {
        String retVal = "This is obermacros confluence plugin";
        return Response.ok(retVal).build();
    }

    @GET
    @AnonymousAllowed
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/base_modules_text")
    public Response getBaseModulesText() {
        String retVal = oberMacros.getBaseModulesSourceText();
        return Response.ok(retVal).build();
    }
}
