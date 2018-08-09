{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}


{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{#
{% block music %}
    <audio loop autoplay controls="controls" style="width:200px;">
        <source src="./audio/valder_fields.mp3" 
        type="audio/mpeg" >
        (您的浏览器不支持 audio 元素。)
    </audio>
{% endblock %}

#}


{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
