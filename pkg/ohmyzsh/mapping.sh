## os os_version scenaior arch pkg_version

mapping() {
  case $1 in
    darwin_default_default_default_default_install)
      echo "mac"
      ;;
    linux_default_default_default_default_install)
      echo "linux"
      ;;
    default_default_default_default_default_install)
      echo "default"
      ;;
    *)
      echo "not support mapping $1"
      ;;
  esac
}

mapping "$@"
