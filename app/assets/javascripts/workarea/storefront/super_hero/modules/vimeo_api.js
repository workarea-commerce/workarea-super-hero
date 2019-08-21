/**
 * @namespace WORKAREA.vimeoApi
 */
WORKAREA.registerModule('vimeoApi', (function () {
    'use strict';

    var getIframe = function(player_id) {
            return $('#'+player_id);
        },

        getLabel = function(iframe) {
            var iframeSrc = iframe.attr('src').split('?')[0],
                label = iframeSrc;

            if (iframe.data('title')) {
                label += ' (' + iframe.data('title') + ')';
            } else if (iframe.attr('title')) {
                label += ' (' + iframe.attr('title') + ')';
            }

            return label;
        },

        sendEvent = function (id, action) {
            var iframe = getIframe(id),
                label = getLabel(iframe);

            WORKAREA.analytics.fireCallback(
                'vimeo',
                {
                    'eventCategory': 'Vimeo',
                    'eventAction': action,
                    'eventLabel': label,
                    'eventValue': undefined
                }
            );
        },

        muteVideo = function (player) {
            player.setVolume(0);
        },

        onPlay = function (playerData) {
            sendEvent(playerData.player_id, 'Play Video');
        },

        onPause = function (playerData) {
            sendEvent(playerData.player_id, 'Paused video');
        },

        onFinish = function (playerData) {
            sendEvent(playerData.player_id, 'Completed video');
        },

        parseOptions = function (index, iframe) {
            var player = new Vimeo.Player(iframe),
                playerData = $(iframe).data('vimeoApi');

            if (playerData.mute === 'true') {
                muteVideo(player);
            }

            player.on('play', _.partial(onPlay, playerData));
            player.on('pause', _.partial(onPause, playerData));
            player.on('finish', _.partial(onFinish, playerData));
        },

        injectSDK = function($vimeoIframes) {
            $.getScript('https://player.vimeo.com/api/player.js', function() {
                $vimeoIframes.each(parseOptions);
            });
        },

        init = function ($scope) {
            var $vimeoIframes = $('[data-vimeo-api]', $scope);

            if (_.isEmpty($vimeoIframes)) { return; }

            injectSDK($vimeoIframes);
        };

    return {
        init: init
    };
}()));
