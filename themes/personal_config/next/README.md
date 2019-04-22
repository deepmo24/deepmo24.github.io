## Next配置

* _config.yml保留个人配置
* 样式修改
    * source/css/_common/components/header/headerband.styl修改handerband背景颜色（顶部那一"横"条）
    * source/css/_schemes/Pisces/_brand.styl修改"site-meta"背景颜色
* author下面显示signature，而不显示description。(description用于SEO)
    1. 设置signature变量：在layout/_layout.swig文件“set description”下新增一行“set signature”。
        
            {% set description = __('description') !== 'description' && __('description') || config.description %}
            {% set signature = __('signature') !== 'signature' && __('signature') || config.signature %}
        signature为hexo的_config.yml下一个字段。
    2. 在layout/_macro/sidebar.swig中更改sidebar显示的description为signature。

            <div class="site-description motion-element" itemprop="description">{{ signature }}</div>

* LeanCloud插件安全性：_config.yml下leadcloud字段下面目前security: false。如果设置为true，则需要安装一个安全插件。（参考[LeanCloud漏洞修复](https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/LEANCLOUD-COUNTER-SECURITY.md))，第一步部署云引擎已做，第二步安装插件是可选的，暂没做。
    