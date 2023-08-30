<#include "/nginx/generateParameterMacro.ftl">
<#include "/nginx/map.ftl">
location ${proxy.basePath}{
<#list proxy.routes as location>
    location ${location.routePath}{
        proxy_pass ${location.proxyPass};
<#list location.plugins as plugins>
<#list plugins.directives as directive>
<#if directive.canonicalName??>
<#assign paramName=directive.canonicalName>
</#if>
<#if directive.directiveParameters??>
<#if directive.canonicalName?? && directive.canonicalName=="map">
<#assign param=directive>
        <@mapParameter arg=param />
                    </#if>
                    <#if directive.canonicalName?? && directive.canonicalName!="map">
        ${directive.canonicalName} <#list directive.directiveParameters as parameter><#if parameter??><#if parameter.type!="VARIABLEARRAY" && parameter.type!="STRINGARRAY"><#assign param=parameter><@generateParameterBlock arg=param /></#if><#if (parameter.type=="VARIABLEARRAY" )><#if paramName !=parameter.name><#assign paramName=parameter.name>${parameter.name} $${parameter.parameterValue}<#else> $${parameter.parameterValue}</#if></#if><#if (parameter.type=="STRINGARRAY" )><#if paramName !=parameter.name><#assign paramName=parameter.name>${parameter.name} ${parameter.parameterValue}<#else> ${parameter.parameterValue}</#if></#if><#if parameter?is_last && ((parameter.type=="VARIABLEARRAY" ) || (parameter.type=="STRINGARRAY" ))>;</#if></#if></#list>
                    </#if>
                </#if>
            </#list></#list>
    }
        </#list>
}