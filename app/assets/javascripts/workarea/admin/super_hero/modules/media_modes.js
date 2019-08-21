/**
 * @namespace WORKAREA.mediaModes
 */
WORKAREA.registerModule('mediaModes', (function () {
    'use strict';

    var activateOptionGroup = function($group) {
            $group.removeClass('hidden');
        },

        deactivateOptionGroup = function ($group) {
            $group.addClass('hidden');
        },

        triggerMediaModeChange = function ($optionGroups, mode) {
            $optionGroups.each(function(index, option) {
                var $option = $(option);

                if ($option.data('mediaMode').includes(mode)) {
                    activateOptionGroup($option);
                } else {
                    deactivateOptionGroup($option);
                }
            });
        },

        setInitialState = function($optionGroups, $control) {
            var selectedOption = $control.val();
            triggerMediaModeChange($optionGroups, selectedOption);
        },

        /**
         * @method
         * @name init
         * @memberof WORKAREA.mediaModes
         */
        init = function ($scope) {
            var $control = $('[data-media-mode="control"]', $scope),
                $optionGroups = $('[data-media-mode]', $scope).not($control);

            if (_.isEmpty($control) ||
                _.isEmpty($optionGroups)) { return; }

            setInitialState($optionGroups, $control);

            $control.on('change', function(event) {
                triggerMediaModeChange($optionGroups, $(event.currentTarget).val());
            });
        };

    return {
        init: init
    };
}()));
