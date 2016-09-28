<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_owl.carousel.min, _IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}

		{if $core.config.custom_colors}
			<style type="text/css">
				body { background-color: {$core.config.custom_color_body_bg}; color: {$core.config.custom_color_text}; }
				h1, h2, h3, h4, h5, h6,
				.box__caption { color: {$core.config.custom_color_headings}; }
				a,
				a:focus { color: {$core.config.custom_color_link}; }
				a:hover { color: {$core.config.custom_color_link_hover}; }

				.inventory { background-color: {$core.config.custom_color_inventory_bg}; }
				.nav-inventory > li > a,
				.nav-inventory > li > a:focus { color: {$core.config.custom_color_inventory_link}; }
				.nav-inventory > li > a:hover { color: {$core.config.custom_color_inventory_link_hover}; }
				.nav-inventory > li.active > a,
				.nav-inventory > li.active > a:focus,
				.nav-inventory > li.active > a:hover { color: {$core.config.custom_color_inventory_link_active}; }

				.navbar-default { background-color: {$core.config.custom_color_navbar_bg}; }
				.navbar-default .navbar-nav > li > a,
				.navbar-default .navbar-nav > li > a:focus { color: {$core.config.custom_color_navbar_link}; }
				.navbar-default .navbar-nav > li > a:hover { color: {$core.config.custom_color_navbar_link_hover}; }
				.navbar-default .navbar-nav > li.active > a,
				.navbar-default .navbar-nav > li.active > a:focus,
				.navbar-default .navbar-nav > li.active > a:hover { color: {$core.config.custom_color_navbar_link_active}; }

				.footer { background: {$core.config.footer_bg}; }
				.nav-footer > li > a,
				.nav-footer > li > a:focus { color: {$core.config.footer_link}; }
				.nav-footer > li > a:hover { color: {$core.config.footer_link_hover}; }
				.nav-footer > li.active > a,
				.nav-footer > li.active > a:focus,
				.nav-footer > li.active > a:hover { color: {$core.config.footer_link_active}; }
			</style>
		{/if}
	</head>

	<body class="page-{$core.page.name}">
		<div class="inventory">
			<div class="container-fluid">
				{ia_blocks block='inventory'}
				{include 'language-selector.tpl'}
				{ia_blocks block='account'}
				{if $core.config.website_social}
					<ul class="nav-inventory nav-inventory-social pull-left hidden-xs">
						{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
						{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
						{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
					</ul>
				{/if}
			</div>
		</div>

		<nav class="navbar navbar-default {if $core.config.navbar_sticky}navbar-sticky{/if}">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
						{if $core.config.enable_text_logo}
							{$core.config.logo_text}
						{else}
							{if !empty($core.config.site_logo)}
								<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
							{else}
								<img src="{$img}logo.png" alt="{$core.config.site}">
							{/if}
						{/if}
					</a>
				</div>

				<div class="collapse navbar-collapse" id="navbar-collapse">
					{if !$member}
						<a href="{$smarty.const.IA_URL}registration/" class="btn navbar-btn navbar-btn-round navbar-right">{lang key='register'}</a>
					{/if}
					<form method="get" action="{$smarty.const.IA_URL}search/" class="search-navbar pull-right">
						<button class="search-navbar__toggle js-search-navbar-toggle" type="button"><span class="fa fa-search"></span></button>

						<div class="search-navbar__input">
							<div class="row">
								<div class="col-sm-10 col-xs-9">
									<input type="text" name="q" class="form-control input-lg" placeholder="{lang key='search_placeholder'}">
								</div>
								<div class="col-sm-2 col-xs-3">
									<button class="btn btn-lg btn-block btn-primary" type="submit"><span class="fa fa-search visible-xs-inline-block"></span><span class="hidden-xs">{lang key='search'}</span></button>
								</div>
							</div>
						</div>
					</form>
					{ia_blocks block='mainmenu'}
				</div>
			</div>
		</nav>

		{if isset($smarty.get.elements)}
			{include file='page.elements.tpl'}
		{else}
			<div class="lt">
				<div class="lt__aside">
					{ia_blocks block='left'}
				</div>
				<div class="lt__content">
					{ia_hooker name='smartyFrontBeforeBreadcrumb'}

					{include 'breadcrumb.tpl'}

					{if isset($iaBlocks.verytop)}
						<div class="verytop">
							<div class="container">{ia_blocks block='verytop'}</div>
						</div>
					{/if}

					<div class="content">
						<div class="container-fluid">
							{if $core.page.name == 'index'}
								{include file='block.index.sponsored.tpl'}
								{include file='block.index.featured.tpl'}
								{ia_blocks block='verytop'}
								{ia_blocks block='bottom'}
							{else}
								{if in_array($core.page.name, array('login', 'member_registration'))}
									<div class="page-system">
										<div class="content__header">
											<h1>{$core.page.title}</h1>
											<ul class="content__actions">
												{foreach $core.actions as $name => $action}
													<li>
														{if 'action-favorites' == $name}
															{printFavorites item=$item itemtype=$item.item guests=true}
														{else}
															<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
																<span class="fa fa-{$name}"></span>
															</a>
														{/if}
													</li>
												{/foreach}
											</ul>
										</div>

										{ia_hooker name='smartyFrontBeforeNotifications'}
										{include 'notification.tpl'}

										{ia_hooker name='smartyFrontBeforeMainContent'}

										<div class="content__body">
											{$_content_}
										</div>

										{ia_hooker name='smartyFrontAfterMainContent'}
									</div>
								{else}
									<div class="row">
										<div class="{width section='content' position='center' tag='col-md-'}">
											<div class="content__wrap">

												{ia_blocks block='top'}

												<div class="content__header">
													<h1>{$core.page.title}</h1>
													<ul class="content__actions">
														{foreach $core.actions as $name => $action}
															<li>
																{if 'action-favorites' == $name}
																	{printFavorites item=$item itemtype=$item.item guests=true}
																{else}
																	<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
																		<span class="fa fa-{$name}"></span>
																	</a>
																{/if}
															</li>
														{/foreach}
													</ul>
												</div>

												{ia_hooker name='smartyFrontBeforeNotifications'}
												{include 'notification.tpl'}

												{ia_hooker name='smartyFrontBeforeMainContent'}

												<div class="content__body">
													{$_content_}
												</div>

												{ia_hooker name='smartyFrontAfterMainContent'}

												{ia_blocks block='bottom'}
											</div>
										</div>
										<div class="{width section='content' position='right' tag='col-md-'} aside">
											{ia_blocks block='right'}
										</div>
									</div>
								{/if}
							{/if}
						</div>
					</div>

					{if isset($iaBlocks.verybottom)}
						<div class="verybottom">
							<div class="container">{ia_blocks block='verybottom'}</div>
						</div>
					{/if}
				</div>
			</div>
		{/if}

		<footer class="footer">
			<div class="container-fluid">
				{ia_hooker name='smartyFrontBeforeFooterLinks'}

				{if $core.config.website_social}
					<ul class="nav-footer nav-footer-social">
						{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
						{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
						{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
					</ul>
				{/if}

				{ia_blocks block='copyright'}

				<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>

				{ia_hooker name='smartyFrontAfterFooterLinks'}
			</div>
		</footer>

		<button class="back-to-top js-back-to-top"><span class="fa fa-angle-double-up"></span></button>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>