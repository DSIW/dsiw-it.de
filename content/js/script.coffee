$ ->
  $('.tlt').textillate
    loop: true
    minDisplayTime: 2500
    in:
      effect: 'fadeIn'
      delayScale: 1.5
      delay: 50
      sync: false
    out:
      effect: 'fadeOut'
      delayScale: 1.5
      delay: 50
      sync: true

  $('.tlt').click (e) ->
    $repoElement = $(e.target).parents('.tlt').find('.texts .current[data-url]')
    if $repoElement.length
      window.open($repoElement.data('url'), '_blank')
