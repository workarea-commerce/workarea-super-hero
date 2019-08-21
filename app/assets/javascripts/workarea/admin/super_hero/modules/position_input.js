/**
 * @namespace WORKAREA.positionInput
 */
WORKAREA.registerModule('positionInput', (function () {
    'use strict';

    var setSelected = function ($svgInput, $selectInput, position) {
            $svgInput
                .find('#'+position+' .position-grid__cell')
                .attr('style', 'fill:#000000');

            $selectInput.val(position).trigger('change');
        },

        updateSelected = function($svgInput, $selectInput, newPosition) {
            clearSelected($svgInput);
            setSelected($svgInput, $selectInput, newPosition);
        },

        clearSelected = function($svgInput) {
            $('g .position-grid__cell', $svgInput).each(function(index, cell) {
                    $(cell).attr('style', 'fill: #ffffff');
                }
            );
        },

        bindSVGEvents = function ($svgInput, $selectInput) {
            $('g', $svgInput).each(function(index, cell) {
                $(cell).on('click', function(event) {
                    event.preventDefault();
                    var newPosition = $(event.currentTarget).attr('id');
                    updateSelected($svgInput, $selectInput, newPosition);
                });
            });
        },

        setupField = function (index, el) {
            var $positionInput = $(el),
                $selectInput = $positionInput.find('select'),
                $svgInput = $positionInput.find('.position-grid'),
                position = $selectInput.val();

            setSelected($svgInput, $selectInput, position);
            bindSVGEvents($svgInput, $selectInput);
        },

        /**
         * @method
         * @name init
         * @memberof WORKAREA.positionInput
         */
        init = function ($scope) {
            $('[data-position-input]', $scope).each(setupField);
        };

    return {
        init: init
    };
}()));
