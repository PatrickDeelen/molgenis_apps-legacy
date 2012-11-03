<#macro plugins_welcome_BbmriWelcomeScreenPlugin screen>
<!-- normally you make one big form for the whole plugin-->
<form method="post" enctype="multipart/form-data" name="${screen.name}" action="">
	<!--needed in every form: to redirect the request to the right screen-->
	<input type="hidden" name="__target" value="${screen.name}">
	<!--needed in every form: to define the action. This can be set by the submit button-->
	<input type="hidden" name="__action">
	
<!-- this shows a title and border -->
	<div class="formscreen">
		<div class="form_header" id="${screen.getName()}">
		${screen.label}
		</div>
		
		<#--optional: mechanism to show messages-->
		<#list screen.getMessages() as message>
			<#if message.success>
		<p class="successmessage">${message.text}</p>
			<#else>
		<p class="errormessage">${message.text}</p>
			</#if>
		</#list>
		
		<div class="screenbody">
			<div class="screenpadding">	
			
			<#if '${screen.getVm7()}'='noneditable'>
			    <h3>Welcome to the Catalogue of Dutch biobanks</h3>
						<p>This catalogue provides a systematic database of collections of biomaterial and associated data subsumed under the umbrella of BBMRI-NL.
						BBMRI-NL is designed to provide infrastructure for biomedical studies. Over 170 major clinical and population biobanks in the Netherlands
						(size 500 subjects or more) are associated with BBMRI-NL.</p>
						<p>Material and data of biobanks associated with BBMRI-NL are available for biomedical research in the public domain. Access conditions for
						scientific cooperation are subject to legal and ethical constraints, which may vary between biobanks. BBMRI-NL aims to harmonize and
						enrich these biobanks in order to stimulate cooperative studies.</p>
						<p>To apply for inclusion of your biobank in this catalogue, please <a href=\"molgenis.do?__target=main&select=BbmriContact\">contact the BBMRI-NL office</a>.</p>
						<p>To find your way around the application, you might want to check out the <a href=\"molgenis.do?__target=main&select=BbmriHelp\">User manual</a>.</p>
						<p>If you have any questions or remarks, please do not hesitate to <a href=\"molgenis.do?__target=main&select=BbmriContact\">contact us</a>.</p>
	
			<#else> 
			 	${screen.getEditableArea()}
					<#assign login = screen.login/>
					<#if login.authenticated>
						<#if '${login.userName}'='admin'>
						   	<div class="title" id="title" name="title">
								  ${screen.getWelcomeTitle()}
							</div>
							<div class="welcomeText" id="welcomeText" name="welcomeText" columns="30000">
							   ${screen.getWelcomeText()}
							</div>
							<!--input id="submitChanges" type="button" value="Submit changes"/-->
							<input type="submit" value="Submit Changes" onclick="__action.value='submitChangestoDB';return true;"/><br /><br />
							<input type="submit" value="Restore original" onclick="__action.value='resetWelcomeTitleText';return true;"/><br /><br />
						</#if>	
					
					<#else>	
							 <div class="nonEditableTitle" id="nonEditableTitle" name="nonEditableTitle">
								  ${screen.getWelcomeTitle()}
							</div>
							<div class="nonEditableWelcomeText" id="nonEditableWelcomeText" name="nonEditableWelcomeText">
							   ${screen.getWelcomeText()}
							</div>
					</#if>
				</#if> 	
						<p>To apply for inclusion of your biobank in this catalogue, please <a href="molgenis.do?__target=main&select=BbmriContact">contact the BBMRI-NL office</a>.</p>
						<p>To find your way around the application, you might want to check out the <a href="molgenis.do?__target=main&select=BbmriHelp">User manual</a>.</p>
						<p>If you have any questions or remarks, please do not hesitate to <a href="molgenis.do?__target=main&select=BbmriContact">contact us</a>.</p>
				
			</div>
		</div>
	</div>
</form>
</#macro>
