<div class="cards">
	<div class="row">
		{foreach $listingsBlocksData.tabs_random as $listing}
			<div class="col-md-4">
				{include file='extra:directory/list-listings' decorate=false}
			</div>

			{if $listing@iteration % 3 == 0 && !$listing@last}
				</div>
				<div class="row">
			{/if}
		{/foreach}
	</div>
</div>