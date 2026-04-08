# appback

Mac 앱 설정 백업/복원 CLI 도구

## 프로젝트 구조

```
appback              # 메인 CLI (실행 파일)
apps/                # 앱별 설정 정의
  dia.sh             # Dia 브라우저
test/                # bats 테스트
  appback.bats
completions/         # 셸 자동완성
  appback.bash
```

## 개발

- Language: Bash
- UI: gum (charmbracelet)
- Task Runner: mise
- Test: `mise run test`
- Lint: `mise run lint`
- Format: `mise run fmt`
