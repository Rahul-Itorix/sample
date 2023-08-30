<#include "/nginx/generateParameterMacro.ftl">

<#macro mapParameter(arg)>
<#assign braces = " ">
        map <#list arg.directiveParameters as param><#assign indexVar = param?index><#if (indexVar <=1)>$${param.parameterValue}${braces}<#assign braces = "{"></#if><#if (indexVar > 1)>
<#assign parameter=param><@generateParameterBlock arg=parameter /></#if></#list>
        }
</#macro>