<?php ob_start(); ?><div class="card"><h2>系统更新</h2><p>为保证供应链安全，本版本已禁用在线更新，请通过自有 GitHub 仓库手动发布审核后的版本。</p></div><?php $content=ob_get_clean(); $subTitle='独立部署'; include __DIR__.'/_shell.php'; ?>
