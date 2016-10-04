# points-travis-ci-cli
# forked from https://github.com/andredumas/docker-travis-ci-cli

Docker container for [travis ci client](http://blog.travis-ci.com/2013-01-14-new-client/) following 
[installation instructions](https://github.com/travis-ci/travis.rb#installation), using Ruby 2.3.1p112.


```
docker pull dev-docker.points.com/travis-ci-cli
```

## Usage

```
docker run --rm -v $PWD:/repo -v ~/.travis:/travis dev-docker.points.com/travis-ci-cli [command]
```

```
$ docker run --rm -v $PWD:/repo -v ~/.travis:/travis dev-docker.points.com/travis-ci-cli -v
1.8.2
```

### Detailed Example

```
$ alias travis='docker run --rm -v $PWD:/repo -v ~/.travis:/travis dev-docker.points.com/travis-ci-cli'
$ travis whoami
not logged in, please run travis login
$ travis login --github-token <public_repo personal access token>
$ travis whoami
user_name
$ travis lint <path to .travis.yml file>
```
