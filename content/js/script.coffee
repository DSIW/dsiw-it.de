class Video
  @scaleVideoContainer: ->
    height = $(window).height() + 5
    unitHeight = parseInt(height) + 'px'
    $('.homepage-hero-module').css('height',unitHeight)

  @initBannerVideoSize: (element) ->
    $(element).each ->
      $(this).data('height', $(this).height())
      $(this).data('width', $(this).width())
    @scaleBannerVideoSize(element)

  @scaleBannerVideoSize: (element) ->
    windowWidth = $(window).width()
    windowHeight = $(window).height() + 5

    $(element).each ->
      videoAspectRatio = $(this).data('height')/$(this).data('width')

      $(this).width(windowWidth)

      if windowWidth < 1000
        videoHeight = windowHeight
        videoWidth = videoHeight / videoAspectRatio
        $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'})

        $(this).width(videoWidth).height(videoHeight)

      $('.homepage-hero-module .video-container video').addClass('fadeIn animated')

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

  $('#header-logo').on 'click', (e) ->
    $('body').scrollTo($('#content'), 500)

  $('nav').scrollex
    enter: (e) ->
      $(this).addClass('animated fadeInDown')
  $('#main').scrollex
    enter: (e) ->
      $(this).find('p').addClass('animated fadeInUp')
      $(this).find('.social').addClass('animated fadeInUp')

  $('.tlt').click (e) ->
    $repoElement = $(e.target).parents('.tlt').find('.texts .current[data-url]')
    if $repoElement.length
      window.open($repoElement.data('url'), '_blank')

  Video.scaleVideoContainer()
  Video.initBannerVideoSize('.video-container .poster img')
  Video.initBannerVideoSize('.video-container .filter')
  Video.initBannerVideoSize('.video-container video')

  $(window).on 'resize', ->
    Video.scaleVideoContainer()
    Video.scaleBannerVideoSize('.video-container .poster img')
    Video.scaleBannerVideoSize('.video-container .filter')
    Video.scaleBannerVideoSize('.video-container video')
