{if isset($categories) && $categories}
	{$num_columns = ((isset($num_columns)) ? $num_columns : 2)}
	{$class_names = ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

	{if $category.parent_id >= 0}<div class="cat-list-simple">{/if}
		<div class="row ia-cats">
			{foreach $categories as $entry}
				<div class="{$class_names[$num_columns - 1]}">
					<div class="ia-cat">
						{if isset($icons) && $icons}
							{if isset($entry.icon) && $entry.icon}
								<img src="{$core.page.nonProtocolUrl}uploads/{$entry.icon.path}" alt="{$entry.title}">
							{else}
								<span class="fa fa-folder-open"></span>
							{/if}
						{/if}

						{if isset($entry.crossed) && $entry.crossed}@&nbsp;{/if}<a href="{ia_url type='url' item=$item data=$entry}">{$entry.title|escape:'html'}</a>
						{if isset($show_amount) && $show_amount}
							&mdash; {$entry.num|default:0}
						{/if}

						{if isset($entry.subcategories) && $entry.subcategories}
							<div class="ia-cat__sub">
								{foreach $entry.subcategories as $subcategory}
									<a href="{ia_url type='url' item=$item data=$subcategory}">{$subcategory.title}</a>{if !$subcategory@last}, {/if}
								{/foreach}
							</div>
						{/if}
					</div>
				</div>

				{if $entry@iteration % $num_columns == 0 && !$entry@last}
					</div>
					<div class="row ia-cats">
				{/if}
			{/foreach}
		</div>

	{if $category.parent_id >= 0}
			<div class="cat-list-simple__more"><a class="js-more-cats" href="#" data-less-cats-text="<span class='fa fa-angle-up'></span> {lang key='less_cats'}" data-more-cats-text="<span class='fa fa-angle-down'></span> {lang key='more_cats'}"><span class="fa fa-angle-down"></span> {lang key='more_cats'}</a></div>
		</div>
	{/if}
{/if}