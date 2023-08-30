<#include "/nginx/map.ftl">
<#if directive.canonicalName?? && directive.canonicalName=="map">
<#assign param=directive>
<@mapParameter arg=param />