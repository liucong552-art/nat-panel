<?php
declare(strict_types=1);
const NC_UPDATE_REPO = '';
function updater_current_version(): array { return ['sha'=>'','short'=>'','time'=>'','updated_at'=>'']; }
function updater_proxy_prefix(): string { return ''; }
function updater_latest_commit(bool $force=false): array { throw new RuntimeException('在线更新已禁用'); }
function updater_recent_commits(int $n=5): array { return []; }
function updater_has_update(array $c,array $r): bool { return false; }
function updater_apply(string $sha,string $time): array { throw new RuntimeException('在线更新已禁用'); }
