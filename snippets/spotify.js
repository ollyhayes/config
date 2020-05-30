// make sure to scroll to the bottom first

console.log(JSON.stringify(
  [...document[(q = 'querySelector') + 'All']('li.tracklist-row')]
    .map(e => ({
      title: e[q]('div.tracklist-name')[i = 'innerText'],
      artist: e[q]('.TrackListRow__artists')[i],
      album: e[q]('.TrackListRow__album')[i],
  })),
  undefined,
  '\t'))

document.documentElement.innerHTML = `<pre>${JSON.stringify(
	  [...document[(q = 'querySelector') + 'All']('li.tracklist-row')]
	    .map(e => ({
			      title: e[q]('div.tracklist-name')[i = 'innerText'],
			      artist: e[q]('.TrackListRow__artists')[i],
			      album: e[q]('.TrackListRow__album')[i],
			  })),
	  undefined,
	  4)}</pre>`
