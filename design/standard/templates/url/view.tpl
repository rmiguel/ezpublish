{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form action={concat("url/view/",$url_object.id)|ezurl} method="post" name="UrlView">
<h1>{'Information on URL'|i18n('design/standard/url')}</h1>
{section show=$url_object.is_valid|not}
<div class="warning">
<p>{"The URL is not considered valid anymore."|i18n('design/standard/url')}</p>
<p>{"This means that the url is no longer available or has been moved."|i18n('design/standard/url')}</p>
</div>
{/section}
<p>{"The URL points to %1."|i18n('design/standard/url',,array(concat('<a href="',$full_url,'">',$full_url,"</a>")))}</p>

<p>{"Objects which use this link"|i18n('design/standard/url')}:
<select name="ObjectList">
{section show=$object_list}
    {section name=ObjectArray loop=$object_list}
    <option value="{$ObjectArray:item.id}">{$ObjectArray:item.name}-{'version'|i18n('design/standard/url')} {$ObjectArray:item.version}</option>
    {/section}
{section-else}
<option value="-1">{'No object available'|i18n('design/standard/url')}</option>
{/section}
</select>
   <input class="button" type="submit" name="EditObject" value="{'Edit'|i18n('design/standard/node/view')}" />
</p>

{section show=$url_object.modified|gt(0)}
<p>{"Last modified at %1"|i18n('design/standard/url',,array($url_object.modified|l10n(shortdatetime)))}</p>
{section-else}
<p>{"URL has no modification date"|i18n('design/standard/url')}</p>
{/section}

{section show=$url_object.last_checked|gt(0)}
<p>{"Last checked at %1"|i18n('design/standard/url',,array($url_object.last_checked|l10n(shortdatetime)))}</p>
{section-else}
<p>{"URL has not been checked"|i18n('design/standard/url')}</p>
{/section}

</form>
