<#macro generateParameterBlock(arg)>
<#switch arg.type>
<#case "STRING"> ${arg.parameterValue};
<#break>
<#case "KEYVALUESTRING"> ${arg.name}=${arg.parameterValue};
    <#break>
<#case "CONSTANT">${arg.parameterValue};
    <#break>
<#case "VARIABLE"> $${arg.parameterValue};
    <#break>
<#case "KEYVALUENUMBER">${arg.name}=${arg.parameterValue};
<#break>
<#case "SINGLECHOICEOBJECT">${arg.name} ${arg.parameterValue};
<#break>
<#case "KEYVALUESTRINGSTRING">${arg.name}=${arg.parameterValue};
<#break>
<#case "RATE">${arg.name}=${arg.parameterValue};
<#break>
<#case "CONDITION">${arg.parameterValue}
<#break>
<#case "CONTEXT">{
    ${arg.parameterValue}
}<#break>
<#case "KEYVALUEVARIABLE">${arg.name}=$${arg.parameterValue};
<#break>
<#case "KEYSPACESTRING">${arg.name} ${arg.parameterValue};
<#break>
<#case "KEYSPACEVARIABLE">${arg.name} $${arg.parameterValue};
<#break>
</#switch>
</#macro>