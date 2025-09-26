<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
	<head>

		{{ component('head-tags') }}

		<link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
		<link rel="preload" href="{{ 'css/style-utilities.scss' | static_url }}" as="style" />
		<link rel="preload" href="{{ 'js/external-no-dependencies.js.tpl' | static_url }}" as="script" />

		{#/*============================================================================
			#CSS and fonts
		==============================================================================*/#}

		<style>
			{# Font families #}

			{{ component(
				'fonts',{
					font_weights: '400,700',
					font_settings: 'settings.font_headings, settings.font_rest'
				})
			}}

			{# General CSS Tokens #}

			{% include "static/css/style-tokens.tpl" %}
		</style>

		{# Critical CSS #}

		{{ 'css/style-critical.scss' | static_url | static_inline }}
		{{ 'css/style-utilities.scss' | static_url | static_inline }}

		{# Load async styling not mandatory for first meaningfull paint #}

		<link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

		{# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

                <style>
                        {{ settings.css_code | raw }}
                </style>

                <style>
                        .site-header {
                                position: sticky;
                                top: 0;
                                z-index: 1030;
                                background: #ffffff;
                                box-shadow: 0 8px 24px rgba(20, 20, 43, 0.08);
                                transition: box-shadow 0.3s ease;
                        }

                        .site-header__top {
                                background: #111827;
                                color: #f9fafb;
                                font-size: 0.75rem;
                        }

                        .site-header__top-inner {
                                display: flex;
                                align-items: center;
                                justify-content: space-between;
                                gap: 1rem;
                                padding: 0.5rem 0;
                        }

                        .site-header__top-link {
                                color: inherit;
                                text-decoration: none;
                                opacity: 0.85;
                                transition: opacity 0.2s ease;
                                display: inline-flex;
                                align-items: center;
                                gap: 0.4rem;
                        }

                        .site-header__top-link:hover,
                        .site-header__top-link:focus {
                                opacity: 1;
                        }

                        .site-header__inner {
                                display: flex;
                                align-items: center;
                                justify-content: space-between;
                                gap: 1.5rem;
                                padding: 0.75rem 0;
                        }

                        .site-header__brand {
                                flex: 0 0 auto;
                                display: flex;
                                align-items: center;
                        }

                        .site-header__logo-img {
                                max-height: 48px;
                        }

                        .site-header__nav {
                                flex: 1 1 auto;
                                display: none;
                        }

                        .site-header__menu {
                                list-style: none;
                                display: flex;
                                align-items: center;
                                gap: 1.75rem;
                                margin: 0;
                                padding: 0;
                        }

                        .site-header__menu-item {
                                position: relative;
                        }

                        .site-header__menu-link {
                                color: #111827;
                                font-weight: 600;
                                text-decoration: none;
                                padding: 0.25rem 0;
                                display: inline-flex;
                                align-items: center;
                                gap: 0.35rem;
                                transition: color 0.2s ease;
                        }

                        .site-header__menu-link:hover,
                        .site-header__menu-link:focus {
                                color: #2563eb;
                        }

                        .site-header__submenu {
                                list-style: none;
                                position: absolute;
                                left: 0;
                                top: calc(100% + 0.75rem);
                                min-width: 200px;
                                margin: 0;
                                padding: 0.75rem 0;
                                background: #ffffff;
                                border-radius: 12px;
                                box-shadow: 0 20px 45px rgba(15, 23, 42, 0.18);
                                opacity: 0;
                                transform: translateY(10px);
                                pointer-events: none;
                                transition: opacity 0.25s ease, transform 0.25s ease;
                        }

                        .site-header__menu-item:hover > .site-header__submenu,
                        .site-header__menu-item:focus-within > .site-header__submenu {
                                opacity: 1;
                                transform: translateY(0);
                                pointer-events: auto;
                        }

                        .site-header__submenu-item {
                                padding: 0;
                        }

                        .site-header__submenu-link {
                                display: block;
                                padding: 0.55rem 1rem;
                                color: #1f2937;
                                text-decoration: none;
                                font-weight: 500;
                                white-space: nowrap;
                                transition: background 0.2s ease, color 0.2s ease;
                        }

                        .site-header__submenu-link:hover,
                        .site-header__submenu-link:focus {
                                background: rgba(37, 99, 235, 0.1);
                                color: #1d4ed8;
                        }

                        .site-header__actions {
                                display: none;
                                align-items: center;
                                gap: 1rem;
                        }

                        .site-header__action-link {
                                color: #1f2937;
                                font-weight: 500;
                                text-decoration: none;
                                transition: color 0.2s ease;
                        }

                        .site-header__action-link:hover,
                        .site-header__action-link:focus {
                                color: #2563eb;
                        }

                        .site-header__cta {
                                border-radius: 999px;
                                padding: 0.65rem 1.4rem;
                                font-weight: 600;
                                box-shadow: 0 10px 25px rgba(37, 99, 235, 0.28);
                        }

                        .site-header__toggle {
                                width: 48px;
                                height: 48px;
                                border: none;
                                background: rgba(37, 99, 235, 0.08);
                                border-radius: 12px;
                                display: inline-flex;
                                align-items: center;
                                justify-content: center;
                                position: relative;
                                transition: background 0.2s ease;
                        }

                        .site-header__toggle:hover,
                        .site-header__toggle:focus {
                                background: rgba(37, 99, 235, 0.14);
                        }

                        .site-header__toggle-line,
                        .site-header__toggle-line::before,
                        .site-header__toggle-line::after {
                                content: '';
                                display: block;
                                width: 22px;
                                height: 2px;
                                background: #1f2937;
                                border-radius: 999px;
                                transition: transform 0.25s ease, opacity 0.25s ease;
                        }

                        .site-header__toggle-line::before {
                                transform: translateY(-6px);
                        }

                        .site-header__toggle-line::after {
                                transform: translateY(6px);
                        }

                        .site-header__toggle--active .site-header__toggle-line {
                                background: transparent;
                        }

                        .site-header__toggle--active .site-header__toggle-line::before {
                                transform: translateY(0) rotate(45deg);
                        }

                        .site-header__toggle--active .site-header__toggle-line::after {
                                transform: translateY(0) rotate(-45deg);
                        }

                        .site-header__mobile {
                                position: fixed;
                                top: 0;
                                right: 0;
                                width: min(320px, 80vw);
                                height: 100vh;
                                background: #ffffff;
                                box-shadow: -10px 0 30px rgba(15, 23, 42, 0.18);
                                transform: translateX(100%);
                                transition: transform 0.3s ease;
                                display: flex;
                                flex-direction: column;
                                padding: 1.25rem 1.5rem 2rem;
                                overflow-y: auto;
                        }

                        .site-header--open .site-header__mobile {
                                transform: translateX(0);
                        }

                        .site-header__mobile-nav {
                                flex: 1 1 auto;
                        }

                        .site-header__mobile-menu,
                        .site-header__mobile-submenu {
                                list-style: none;
                                margin: 0;
                                padding: 0;
                        }

                        .site-header__mobile-item {
                                border-bottom: 1px solid rgba(15, 23, 42, 0.08);
                                padding: 0.75rem 0;
                        }

                        .site-header__mobile-link {
                                color: #111827;
                                font-weight: 600;
                                text-decoration: none;
                        }

                        .site-header__mobile-submenu-toggle {
                                border: none;
                                background: none;
                                padding: 0.25rem;
                                margin-left: auto;
                                color: #6b7280;
                                display: inline-flex;
                                align-items: center;
                                justify-content: center;
                                transition: transform 0.2s ease;
                        }

                        .site-header__mobile-submenu-toggle[aria-expanded='true'] {
                                transform: rotate(180deg);
                                color: #2563eb;
                        }

                        .site-header__mobile-submenu {
                                margin-top: 0.65rem;
                                padding-left: 0.75rem;
                                display: none;
                        }

                        .site-header__mobile-submenu.is-open {
                                display: block;
                        }

                        .site-header__mobile-submenu-link {
                                display: block;
                                padding: 0.45rem 0;
                                color: #4b5563;
                                text-decoration: none;
                                font-weight: 500;
                        }

                        .site-header__mobile-actions {
                                margin-top: 1.5rem;
                                display: grid;
                                gap: 0.75rem;
                        }

                        .site-header__backdrop {
                                position: fixed;
                                inset: 0;
                                background: rgba(15, 23, 42, 0.45);
                                opacity: 0;
                                pointer-events: none;
                                transition: opacity 0.3s ease;
                        }

                        .site-header--open .site-header__backdrop {
                                opacity: 1;
                                pointer-events: auto;
                        }

                        .sr-only {
                                position: absolute !important;
                                width: 1px;
                                height: 1px;
                                padding: 0;
                                margin: -1px;
                                overflow: hidden;
                                clip: rect(0, 0, 0, 0);
                                white-space: nowrap;
                                border: 0;
                        }

                        body.no-scroll {
                                overflow: hidden;
                        }

                        @media (min-width: 768px) {
                                .site-header__toggle {
                                        width: 52px;
                                        height: 52px;
                                }
                        }

                        @media (min-width: 992px) {
                                .site-header__nav {
                                        display: block;
                                }

                                .site-header__actions {
                                        display: inline-flex;
                                }

                                .site-header__toggle,
                                .site-header__mobile,
                                .site-header__backdrop {
                                        display: none;
                                }

                                .site-header__inner {
                                        padding: 1rem 0;
                                }
                        }

                        @media (max-width: 575.98px) {
                                .site-header__top-inner {
                                        flex-direction: column;
                                        align-items: flex-start;
                                }
                        }
                </style>

		{#/*============================================================================
			#Javascript: Needed before HTML loads
		==============================================================================*/#}

		{# Defines if async JS will be used by using script_tag(true) #}

		{% set async_js = true %}

		{# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

		{% set nojquery = true %}

		{# Loads private Tiendanube JS #}

		{% head_content %}

		{# Structured data to provide information for Google about the page content #}

		{{ component('structured-data') }}

	</head>
	<body class="body-password">

		{# Theme icons #}

		{% include "snipplets/svg/icons.tpl" %}

		{# Back to admin bar #}

		{{back_to_admin}}

		{# Page content #}

		{% set header_colors_classes = settings.header_colors ? 'head-colors' %}

        {% set header_links_raw = attribute(navigation | default({}), 'links') | default([]) %}
        {% set fallback_links = [
                {'title': 'Inicio' | translate, 'url': store.url | default('/')},
                {'title': 'Productos' | translate, 'url': store.url | default('/') ~ '/productos'},
                {'title': 'Promociones' | translate, 'url': store.url | default('/') ~ '/promociones'},
                {'title': 'Contacto' | translate, 'url': store.url | default('/') ~ '/contacto'}
        ] %}
        {% set header_links = header_links_raw is iterable and header_links_raw is not empty ? header_links_raw : fallback_links %}
        {% set contact_items = [] %}
        {% if store.phone %}
                {% set phone_href = 'tel:' ~ store.phone | replace({' ': '', '-': '', '(': '', ')': ''}) %}
                {% set contact_items = contact_items | merge([{'label': store.phone, 'href': phone_href}]) %}
        {% endif %}
        {% if store.whatsapp %}
                {% set whatsapp_href = 'https://wa.me/' ~ store.whatsapp | replace({' ': '', '-': '', '(': '', ')': ''}) %}
                {% set contact_items = contact_items | merge([{'label': 'WhatsApp', 'href': whatsapp_href}]) %}
        {% endif %}
        {% if store.email %}
                {% set contact_items = contact_items | merge([{'label': store.email, 'href': 'mailto:' ~ store.email}]) %}
        {% endif %}

        <header class="site-header" data-component="enhanced-header">
                {% if contact_items is not empty %}
                        <div class="site-header__top">
                                <div class="container">
                                        <div class="site-header__top-inner">
                                                {% for contact in contact_items %}
                                                        <a class="site-header__top-link" href="{{ attribute(contact, 'href') }}">
                                                                <span>{{ attribute(contact, 'label') }}</span>
                                                        </a>
                                                {% endfor %}
                                        </div>
                                </div>
                        </div>
                {% endif %}
                <div class="container">
                        <div class="site-header__inner">
                                <div class="site-header__brand">
                                        {{ component('logos/logo', {
                                                logo_size: 'large',
                                                logo_img_classes: 'transition-soft site-header__logo-img',
                                                logo_text_classes: 'h3 m-0'
                                        }) }}
                                </div>
                                <nav class="site-header__nav" aria-label="{{ 'Navegación principal' | translate }}">
                                        <ul class="site-header__menu">
                                                {% for link in header_links %}
                                                        {% set child_links = attribute(link, 'links') | default([]) %}
                                                        {% set has_children = child_links is iterable and child_links is not empty %}
                                                        {% set link_url = attribute(link, 'url') | default('#') %}
                                                        {% set link_title = attribute(link, 'title') | default('') %}
                                                        <li class="site-header__menu-item{% if has_children %} has-children{% endif %}">
                                                                <a class="site-header__menu-link" href="{{ link_url }}">
                                                                        <span>{{ link_title }}</span>
                                                                </a>
                                                                {% if has_children %}
                                                                        <ul class="site-header__submenu">
                                                                                {% for child in child_links %}
                                                                                        {% set child_url = attribute(child, 'url') | default('#') %}
                                                                                        {% set child_title = attribute(child, 'title') | default('') %}
                                                                                        <li class="site-header__submenu-item">
                                                                                                <a class="site-header__submenu-link" href="{{ child_url }}">{{ child_title }}</a>
                                                                                        </li>
                                                                                {% endfor %}
                                                                        </ul>
                                                                {% endif %}
                                                        </li>
                                                {% endfor %}
                                        </ul>
                                </nav>
                                <div class="site-header__actions">
                                        <a class="site-header__action-link" href="{{ store.url | default('/') }}/cart">{{ 'Carrito' | translate }}</a>
                                        <a class="btn btn-primary site-header__cta" href="{{ store.url | default('/') }}/contacto">{{ 'Contacto' | translate }}</a>
                                </div>
                                <button class="site-header__toggle" type="button" aria-expanded="false" aria-controls="site-header-mobile">
                                        <span class="sr-only">{{ 'Abrir menú' | translate }}</span>
                                        <span class="site-header__toggle-line"></span>
                                </button>
                        </div>
                </div>
                <div class="site-header__backdrop" hidden></div>
                <div class="site-header__mobile" id="site-header-mobile" hidden>
                        <nav class="site-header__mobile-nav" aria-label="{{ 'Navegación móvil' | translate }}">
                                <ul class="site-header__mobile-menu">
                                        {% for link in header_links %}
                                                {% set child_links = attribute(link, 'links') | default([]) %}
                                                {% set has_children = child_links is iterable and child_links is not empty %}
                                                {% set link_url = attribute(link, 'url') | default('#') %}
                                                {% set link_title = attribute(link, 'title') | default('') %}
                                                <li class="site-header__mobile-item{% if has_children %} has-children{% endif %}">
                                                        <div class="d-flex align-items-center gap-2">
                                                                <a class="site-header__mobile-link" href="{{ link_url }}">{{ link_title }}</a>
                                                                {% if has_children %}
                                                                        <button class="site-header__mobile-submenu-toggle" type="button" aria-expanded="false">
                                                                                <span class="sr-only">{{ 'Abrir submenú de {1}' | translate(link_title) }}</span>
                                                                                <svg class="icon-inline icon-sm" aria-hidden="true"><use xlink:href="#chevron-down"/></svg>
                                                                        </button>
                                                                {% endif %}
                                                        </div>
                                                        {% if has_children %}
                                                                <ul class="site-header__mobile-submenu" hidden>
                                                                        {% for child in child_links %}
                                                                                {% set child_url = attribute(child, 'url') | default('#') %}
                                                                                {% set child_title = attribute(child, 'title') | default('') %}
                                                                                <li>
                                                                                        <a class="site-header__mobile-submenu-link" href="{{ child_url }}">{{ child_title }}</a>
                                                                                </li>
                                                                        {% endfor %}
                                                                </ul>
                                                        {% endif %}
                                                </li>
                                        {% endfor %}
                                </ul>
                        </nav>
                        <div class="site-header__mobile-actions">
                                <a class="btn btn-primary btn-block" href="{{ store.url | default('/') }}/productos">{{ 'Explorar productos' | translate }}</a>
                                <a class="btn btn-outline-secondary btn-block" href="{{ store.url | default('/') }}/contacto">{{ 'Hablar con nosotros' | translate }}</a>
                                {% if contact_items is not empty %}
                                        <div class="font-small text-muted">
                                                {% for contact in contact_items %}
                                                        <div class="mb-1">
                                                                <a class="site-header__action-link" href="{{ attribute(contact, 'href') }}">{{ attribute(contact, 'label') }}</a>
                                                        </div>
                                                {% endfor %}
                                        </div>
                                {% endif %}
                        </div>
                </div>
        </header>
        <div class="flex-grow-1 h-100 d-flex align-items-center">
            <div class="container py-5">
                <div class="d-flex justify-content-center">
                    <div class="w-md-40">
                        <h2 class="h4 mb-4 text-center">{{ message }}</h2>
                        {% embed "snipplets/forms/form.tpl" with{form_id: 'password-form', submit_text: 'Desbloquear' | translate, submit_custom_class: 'btn-block btn-big', form_custom_class: 'w-100' } %}
                            {% block form_body %}

                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_label_text: 'Contraseña de acceso' | translate, input_placeholder: 'ej.: tucontraseña' | translate } %}
                                    {% block input_form_alert %}
                                        {% if invalid_password == true %}
                                            <div class="alert alert-danger mt-3">{{ 'La contraseña es incorrecta.' | translate }}</div>
                                        {% endif %}
                                    {% endblock input_form_alert %}
                                {% endembed %}
                            {% endblock %}
                        {% endembed %}
                    </div>
                </div>
            </div>
        </div>

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

                <script>
                        (function () {
                                const header = document.querySelector('[data-component="enhanced-header"]');
                                if (!header) {
                                        return;
                                }

                                const toggle = header.querySelector('.site-header__toggle');
                                const mobilePanel = header.querySelector('#site-header-mobile');
                                const backdrop = header.querySelector('.site-header__backdrop');
                                const desktopBreakpoint = window.matchMedia('(min-width: 992px)');

                                const closeMenu = function () {
                                        header.classList.remove('site-header--open');
                                        if (toggle) {
                                                toggle.classList.remove('site-header__toggle--active');
                                                toggle.setAttribute('aria-expanded', 'false');
                                                toggle.focus({preventScroll: true});
                                        }
                                        if (mobilePanel) {
                                                mobilePanel.setAttribute('hidden', '');
                                        }
                                        if (backdrop) {
                                                backdrop.setAttribute('hidden', '');
                                        }
                                        document.body.classList.remove('no-scroll');
                                };

                                const openMenu = function () {
                                        header.classList.add('site-header--open');
                                        if (toggle) {
                                                toggle.classList.add('site-header__toggle--active');
                                                toggle.setAttribute('aria-expanded', 'true');
                                        }
                                        if (mobilePanel) {
                                                mobilePanel.removeAttribute('hidden');
                                                const focusable = mobilePanel.querySelector('a, button');
                                                if (focusable) {
                                                        focusable.focus({preventScroll: true});
                                                }
                                        }
                                        if (backdrop) {
                                                backdrop.removeAttribute('hidden');
                                        }
                                        document.body.classList.add('no-scroll');
                                };

                                if (toggle) {
                                        toggle.addEventListener('click', function () {
                                                const expanded = toggle.getAttribute('aria-expanded') === 'true';
                                                if (expanded) {
                                                        closeMenu();
                                                } else {
                                                        openMenu();
                                                }
                                        });
                                }

                                if (backdrop) {
                                        backdrop.addEventListener('click', closeMenu);
                                }

                                document.addEventListener('keydown', function (event) {
                                        if (event.key === 'Escape') {
                                                closeMenu();
                                        }
                                });

                                const mobileLinks = mobilePanel ? mobilePanel.querySelectorAll('.site-header__mobile-menu a') : [];
                                mobileLinks.forEach(function (link) {
                                        link.addEventListener('click', closeMenu);
                                });

                                const submenuToggles = header.querySelectorAll('.site-header__mobile-submenu-toggle');
                                submenuToggles.forEach(function (button) {
                                        button.addEventListener('click', function () {
                                                const expanded = button.getAttribute('aria-expanded') === 'true';
                                                const submenu = button.closest('li')?.querySelector('.site-header__mobile-submenu');
                                                button.setAttribute('aria-expanded', expanded ? 'false' : 'true');
                                                if (submenu) {
                                                        if (expanded) {
                                                                submenu.classList.remove('is-open');
                                                                submenu.setAttribute('hidden', '');
                                                        } else {
                                                                submenu.classList.add('is-open');
                                                                submenu.removeAttribute('hidden');
                                                        }
                                                }
                                        });
                                });

                                const handleDesktopChange = function (event) {
                                        if (event.matches) {
                                                closeMenu();
                                        }
                                };

                                if (desktopBreakpoint && desktopBreakpoint.addEventListener) {
                                        desktopBreakpoint.addEventListener('change', handleDesktopChange);
                                } else if (desktopBreakpoint && desktopBreakpoint.addListener) {
                                        desktopBreakpoint.addListener(handleDesktopChange);
                                }
                        })();
                </script>

                {# Javascript needed to footer logos lazyload #}

                {{ 'js/external-no-dependencies.js.tpl' | static_url | script_tag }}

		{# Google survey JS for Tiendanube Survey #}

		{% include "static/js/google-survey.js.tpl" %}

	</body>
</html>
